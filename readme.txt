This toolbox is implemented by Ramnarayan Patro (Scholar IIIT, Bhubaneswar) 

This is an implementation of the paper "Conditional Classifier- A new approach" 
submitted to journal "MDPI-DATA", which is awaited for approval.

Authors : Ramnarayan Patro, Subhashree Subudhi, 
	  Dr. Pradyut Kumar Biswal (IIIT Bhubaneswar, India)
	  Dr. Fabio Dell'Acqua (University of Pavia, Italy)
	  Dr. Harish Kumar Sahoo (VSSUT, Burla, India)

For the purpose of classification of binary dataset.

Eight dataset are already given as an example
1. Clean1
2. eigththr
3. glass
4. Hvelywonoise
5. Parkinsons
6. Sonar
7. ionoshpere
8. BCancerO

All these dataset are downloaded from from UCI Machine learning repository 
and converted to matlab (.mat) format.

All the matlab formatted datasets used in the paper can be downloaded from


Dimension reduction toolkit (by Laurens van der Maaten, Research scientist in machine learning 
and computer vision,https://lvdmaaten.github.io/drtoolbox/) used here inorder to reduce the features.

Seven classifiers are incorporated along with our proposed Conditional Classifier (CC)

1. CC
2. KNN
3. SVM-linear
4. SVM-rbf
5. NN
6. DTree
7. Naivebayes
8. RForest

CC classifier is implemented with three functions : 
"binary_cond" for training,
"prepare_matrix_classification" and "update_fuzzy_output" for testing.

These functions are made protected. After acceptance of our publication 
these will be made openly available to the users.

A video of toolkit operation can be found at :
https://www.youtube.com/watch?v=kiwx3TXwQ7I&feature=youtu.be

From the experts, I need suggestion for improvement of the toolkit.

For any related query or modification on toolkit please reach me at :
ram_patro@rediffmail.com
c116009@iiit-bh.ac.in

