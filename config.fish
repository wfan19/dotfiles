set -U fish_greeting ""
#source /opt/ros/melodic/share/rosbash/rosfish
#bass source /opt/ros/foxy/setup.bash
bass source /opt/ros/humble/setup.bash
export ROS_DOMAIN_ID=11

if test $TMUX
    switch (tmux display-message -p '#S')
	case "tagslam" # Tagslam workspace
	    # bass source /home/bf01/tagslam_ws/tagslam_root/devel/setup.bash
    case "tagslam_background" # Workspace for running background processing scripts
	    # bass source /home/bf01/tagslam_ws/tagslam_root/devel/setup.bash
        export ROS_MASTER_URI="http://localhost:11314"
    case "comprobo"
        bass source ~/comprobo_ws/install/setup.bash
        export CC=clang-16
        export CXX=clang++-16

        register-python-argcomplete --shell fish ros2 | source
	case '*' # Default environment
	    # bass source /home/bf01/catkin_ws/devel/setup.bash
    end
end

set MANPATH "/usr/local/texlive/2022/texmf-dist/doc/man:$MANPATH"
set INFOPATH "/usr/local/texlive/2022/texmf-dist/doc/info:$INFOPATH"
set PATH "/usr/local/texlive/2022/bin/x86_64-linux:$PATH"

#export http_proxy=http://127.0.0.1:10809
#export https_proxy=http://127.0.0.1:10809
#export all_proxy=socks5://127.0.0.1:10808

