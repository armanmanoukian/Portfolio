import os, shutil
path = r"C:\Users\arman.manoukyan\OneDrive\Desktop\Python\New folder/"
file_name=os.listdir(path)
Folder_names = ['csv files', 'image files', 'text files']
for loop in range (0,3):
    if not os.path.exists(path + Folder_names[loop]):
        #print ((path + Folder_names[loop]))
        os.makedirs((path + Folder_names[loop]))
        
for file in file_name:
    if ".csv" in file and not os.path.exists(path + "csv files/"+ file):
        shutil.move(path +file, path +"csv files/"+file)
        
    elif ".rtf" in file and not os.path.exists(path + "text files/"+ file):
        shutil.move(path +file, path +"text files/"+file)       
        
    elif ".jpg" and ".png" in file and not os.path.exists(path + "image files/"+ file):
        shutil.move(path +file, path +"image files/"+file)  
    else :
        print ("There are files in this path were not moved")
        
        
             