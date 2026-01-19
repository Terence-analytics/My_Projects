import os, shutil
# path
path = r"C:/Users/Me/Downloads/ict 2022 mentorship/data analyst bootcamp/Tutorials/"
# steps- 1) create folders, 2) check if files exists and sort the files in respective folders
files = os.listdir(path)
# check if file exist: os.path.exist(path) if not make one : os.makedirs()
# print(os.path.exists(path= 'CSV_filed'))
folders = ['PDF_files', 'HTML_files', 'JPG_files', 'XLSX_files', 'SQL_files', 'CSV_files', 'PYTHON_files','JUPYTERNOTEBOOK_files']
for i in range(0, len(folders)):
    if not os.path.exists((path + folders[i])):
        os.makedirs((path + folders[i]))

# code a script to check file type and place in respective folder
k = 0  # index for folders
f_types = ['.csv', '.pdf', '.jpg', '.xlsx', '.sql', '.html','.py', '.ipynb']
for file in files:
    if '.csv' in file and not os.path.exists(path + "CSV_files" + file):
        shutil.move(path+file, path+"CSV_files/"+file)
    elif '.pdf' in file and not os.path.exists(path + "PDF_files" + file):
        shutil.move(path + file, path + "PDF_files/" + file)
    elif '.jpg' in file and not os.path.exists(path + "JPG_files" + file):
        shutil.move(path + file, path + "JPG_files/" + file)
    elif '.xlsx' in file and not os.path.exists(path + "XLSX_files" + file):
        shutil.move(path + file, path + "XLSX_files/" + file)
    elif '.sql' in file and not os.path.exists(path + "SQL_files" + file):
        shutil.move(path + file, path + "SQL_files/" + file)
    elif '.html' in file and not os.path.exists(path + "HTML_files" + file):
        shutil.move(path + file, path + "HTML_files/" + file)
    elif '.py' in file and not os.path.exists(path + "PYTHON_files" + file):
        shutil.move(path + file, path + "PYTHON_files/" + file)
    elif '.ipynb' in file and not os.path.exists(path + "PYTHON_files" + file):
        shutil.move(path + file, path + "JUPYTERNOTEBOOK_files/" + file)

