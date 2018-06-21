# Utility to keep sudo active
sudo echo
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Setup Intel Server
echo 'deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main' | sudo tee /etc/apt/sources.list.d/realsense-public.list
sudo apt-key adv --keyserver keys.gnupg.net --recv-key 6F3EFCDE

# Install wstool and rosdep
sudo apt-get update
sudo apt-get install -y python-wstool python-rosdep ninja-build librealsense2-dkms librealsense2-utils librealsense2-dev librealsense2-dbg

# Setup src files
wstool init src
wstool merge -t src https://raw.githubusercontent.com/KAIST-NMAIL/tbot_ws/master/ws.rosinstall
wstool update -t src

# Install protobuf 3
src/cartographer/scripts/install_proto3.sh

# Install .deb dependencies (sudo rosdep init will print an error
#  if it was already run, this can safely be ignored)
sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y

catkin_make_isolated --use-ninja
source devel_isolated/setup.bash