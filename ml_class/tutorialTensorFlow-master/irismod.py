import numpy as np
import pandas as pd

import tensorflow as tf
from tensorflow.keras import layers

df=pd.read_csv('~/tutorialTensorFlow/iris.data') 
data_raw_x = df[['sep_l','sep_w','pet_l','pet_w']]

data_x = data_raw_x.values
data_y = pd.factorize(df.classes)[0]

class_names = ['Iris-setosa','Iris-versicolor','Iris-virginica']

model1 = tf.keras.Sequential()
model1.add(layers.Dense(128,activation = 'relu',input_shape=data_x[0].shape))
model1.add(layers.Dense(128,activation = 'relu'))
model1.add(layers.Dense(128,activation = 'relu'))
model1.add(layers.Dense(128,activation = 'relu'))
model1.add(layers.Dense(128,activation = 'relu'))
model1.add(layers.Dense(3,activation = 'softmax'))
model1.summary()

ep = 10
model1.compile(optimizer=tf.keras.optimizers.Adam(lr =0.0001),
              loss=tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True),
              metrics=['accuracy'])
model1.fit(data_x, data_y,batch_size=1, epochs=ep)
