#include "ros/ros.h"
#include <iostream>
#include "pypy/input_ann.h"
#include "pypy/output_ann.h"

using namespace std;

void ann_cb(const pypy::output_ann& predict);

ros::Publisher pub;
pypy::input_ann wkwk;

ros::Subscriber sub;

double px_act_predict,py_act_predict,psi_act_predict,v_act_predict,cte_act_predict,epsi_act_predict;
int number_data =1;
int number_predict = 0;
int main(int argc, char **argv)
{
	ros::init(argc, argv, "test");
	ros::NodeHandle n;

	pub	= n.advertise<pypy::input_ann>("minicar/input_ann", 10);
	sub	= n.subscribe("minicar/output_ann", 10, ann_cb);
	 
	while(ros::ok()){
		while(number_predict != number_data){
			wkwk.number_input 		= number_data;
			wkwk.v_minicar 	 		= 0.42146;
			wkwk.dt_minicar 	 		= 0.1;
			wkwk.steering_minicar 	= 0.35197;
			wkwk.Lf_minicar 		    = 0.25;
			wkwk.throttle_minicar 	= 1;
			wkwk.cte_minicar 			= 0.07659;
			wkwk.epsi_minicar 		= 0.5903;
		
			pub.publish(wkwk);	
			cout<<"[CPP] I send "<<wkwk<<endl;
			ros::spinOnce();
			//cout<< "number_data_loop: "<<wkwk.number_input <<endl;
			sleep(1);
		}
		
		//cout<< "number_predict: "<<number_predict<<endl;
		//cout<< "number_data: "<<number_data<<endl;
		number_data++;
		cout<<"[CPP] I got "<<number_predict<<endl<<px_act_predict<<endl<<py_act_predict<<endl<<psi_act_predict<<endl<<v_act_predict<<endl<<cte_act_predict<<endl<<epsi_act_predict<<endl<<endl;
		//cout<<"hehe"<<endl;
		sleep(1);
	}
	//0.42146/0.1/0.35197/0.25/1/0.07659/0.5903	
	//0.04215/0/0.05934/0.52146/0.10005/-0.53096

}

void ann_cb(const pypy::output_ann& predict){
	number_predict 	= predict.number_output;
	px_act_predict	= predict.px_act_minicar; 	
	py_act_predict	= predict.py_act_minicar;		 
	psi_act_predict	= predict.psi_act_minicar; 	
	v_act_predict		= predict.v_act_minicar; 		
	cte_act_predict	= predict.cte_act_minicar;	
	epsi_act_predict	= predict.epsi_act_minicar;	
}
