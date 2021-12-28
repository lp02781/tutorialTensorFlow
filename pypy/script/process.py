#!/usr/bin/env python
# license removed for brevity
import rospy
from std_msgs.msg import Int16

a = 0
pub = rospy.Publisher('post_py', Int16, queue_size=10)

def callback(data):
	a = data.data
	rospy.loginfo("[PYPY] I got %d", a)
	
	c = a + 5
	pub.publish(c)
	rospy.loginfo("[PYPY] I post %d", c)
	
	
def haha():
	rospy.init_node('process', anonymous=True)
	
	rate = rospy.Rate(10) # 10hz
	
	while not rospy.is_shutdown():
		rospy.Subscriber("post_cpp", Int16, callback)
		rate.sleep()
  
if __name__ == '__main__':
	try:
		haha()
	except rospy.ROSInterruptException:
		pass
