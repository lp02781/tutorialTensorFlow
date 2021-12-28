#include "ros/ros.h"
#include <iostream>
#include "std_msgs/Int16.h"

using namespace std;

void status_cb(const std_msgs::Int16& data);

ros::Publisher pub;
std_msgs::Int16 wkwk;

int main(int argc, char **argv)
{
	ros::init(argc, argv, "test");
	ros::NodeHandle n;

	pub	= n.advertise<std_msgs::Int16>("post_cpp", 10);
	ros::Subscriber sub	= n.subscribe("post_py", 1, status_cb);
	
	ros::Rate loop_rate(10);
	 
	while(ros::ok()){
		sleep(0.1);
		wkwk.data = 2;
		pub.publish(wkwk);	
		cout<<"[CPP] I send "<<wkwk.data<<endl;
		ros::spinOnce();
		loop_rate.sleep();
	}
}

void status_cb(const std_msgs::Int16& data){
	cout<<"[CPP] I got "<<data.data<<endl;
}
