# tbot_ws
Auto workspace setup for Turtlebot based testing platform

## Usage:
* `. install.sh` (this will fully setup the workspace)
* `. build.sh` (this will rebuild if any changes made in src/\*)
* `. source` (this sources the workspace so that you can roslaunch things)

# Velodyne

* velodyne : [link](http://wiki.ros.org/velodyne/Tutorials/Getting%20Started%20with%20the%20Velodyne%20VLP16)

## topics
* /scan
* /velodyne_packets
* /velodyne_points


# Example

* Cartographer_turtlebot_demo

ref: [link](https://google-cartographer-ros-for-turtlebots.readthedocs.io/en/latest/)

```
# Download the example bag.
wget -P ~/Downloads https://storage.googleapis.com/cartographer-public-data/bags/turtlebot/cartographer_turtlebot_demo.bag

# Launch the 2D LIDAR demo.
roslaunch cartographer_turtlebot demo_lidar_2d.launch bag_filename:=${HOME}/Downloads/cartographer_turtlebot_demo.bag

# Launch the 2D depth camera demo.
roslaunch cartographer_turtlebot demo_depth_camera_2d.launch bag_filename:=${HOME}/Downloads/cartographer_turtlebot_demo.bag

# Launch the 3D depth camera demo.
roslaunch cartographer_turtlebot demo_depth_camera_3d.launch bag_filename:=${HOME}/Downloads/cartographer_turtlebot_demo.bag
```


# Troubleshooting

1. Suitesparse problem
* ref: [link](https://github.com/googlecartographer/cartographer/issues/993)

* ceres-solver build
```
cd src/ceres-solver
mkdir build
cd build
cmake .. -G Ninja -DCXX11=ON  -DCMAKE_INSTALL_PREFIX=/usr/local/stow/ceres
ninja -j15
sudo ninja install
cd /usr/local/stow/
sudo stow ceres
```

* rebuild Cartographer
```
cd src/cartographer
cmake ./CMakeLists.txt -G Ninja && ninja -j15
```

2. pcap.h error
* ref: [link](http://blog.whitelife.co.kr/159)

```
sudo apt-get install libpcap0.8-dev
```
