#!/usr/bin/env python
# license removed for brevity
import rospy
from std_msgs.msg import Int16
from pypy.msg import input_ann 
from pypy.msg import output_ann
import tensorflow as tf
import numpy as np
import pandas as pd

pub = rospy.Publisher('minicar/output_ann', output_ann, queue_size=10)
data_predict = output_ann()

model_new = tf.keras.models.Sequential([
	tf.keras.layers.Dense(512, activation=tf.nn.relu),
	tf.keras.layers.Dense(512, activation=tf.nn.relu),
	tf.keras.layers.Dense(512, activation=tf.nn.relu),
	tf.keras.layers.Dense(512, activation=tf.nn.relu),
	tf.keras.layers.Dense(512, activation=tf.nn.relu),
	tf.keras.layers.Dense(6, activation= tf.keras.activations.linear)
   ])
model_new.compile(optimizer= tf.keras.optimizers.Adam(learning_rate =0.001),loss='mean_squared_error',metrics=['accuracy'])
model_new.load_weights('../mpc_minicar/model/ann_hypharos/model_hypharos')
#model_new.summary()

X_haha = np.array([[0, 0, 0, 0, 0, 0, 0]],dtype=float);
Y_haha = np.array([[0, 0, 0, 0, 0, 0]],dtype=float);

def callback(data):
	#v, dt, steering, Lf, throttle, cte, epsi
		#rospy.loginfo("################################################hoho")
#if data.number_input==number_data+1 :
		#	= data.number_input
			
		X_haha[0,0] = data.v_minicar
		X_haha[0,1] = data.dt_minicar
		X_haha[0,2] = data.steering_minicar
		X_haha[0,3] = data.Lf_minicar
		X_haha[0,4] = data.throttle_minicar
		X_haha[0,5] = data.cte_minicar
		X_haha[0,6] = data.epsi_minicar
	
		#print('input:', X_haha)
		#rospy.loginfo("##############################################haha")
		#https://www.tensorflow.org/tutorials/keras/regression
		Y_haha = model_new.predict(X_haha)
		
		#number_process = data.number_input
		
		#print('number_process:', data.number_input)
		
		#px_act, py_act, psi_act, v_act, cte_act, epsi_act
		data_predict.number_output 		= data.number_input
		data_predict.px_act_minicar 		= Y_haha[0,0]
		data_predict.py_act_minicar		= Y_haha[0,1] 
		data_predict.psi_act_minicar 	= Y_haha[0,2]
		data_predict.v_act_minicar 		= Y_haha[0,3]
		data_predict.cte_act_minicar		= Y_haha[0,4]
		data_predict.epsi_act_minicar	= Y_haha[0,5]
		pub.publish(data_predict)
		
		#print('number_process:', data.number_input)
		#rospy.loginfo("######################################################hehe")
	
def haha():
	rospy.init_node('ann_minicar', anonymous=True)
	
	while not rospy.is_shutdown():
		rospy.Subscriber("minicar/input_ann", input_ann, callback)
		#rospy.loginfo("hehe")
		rospy.sleep(1)
  
if __name__ == '__main__':
	try:
		haha()
	except rospy.ROSInterruptException:
		pass
