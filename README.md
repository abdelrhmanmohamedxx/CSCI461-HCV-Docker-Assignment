

## Project Title

**HCV Dataset Analysis and Machine Learning Using Docker**


## 1. Project Description

This project focuses on data analysis, preprocessing, visualization, supervised machine learning, and unsupervised clustering using the HCV (Hepatitis C Virus) dataset.

The project was developed using Python and JupyterLab inside a custom Docker environment to ensure reproducibility, portability, and consistent execution.

### Project Components

- Dataset exploration and understanding
- Missing value identification and treatment
- Duplicate detection
- Pandas `loc` and `iloc` operations
- Data transformations and feature creation
- Simple random sampling
- Stratified sampling
- Cluster sampling
- Correlation analysis and visualization
- Category distribution analysis
- Logistic Regression classification
- Random Forest classification (Bonus)
- Supervised machine learning model comparison (Bonus)
- Model performance evaluation
- Confusion matrix visualization
- K-Means clustering
- Silhouette score evaluation
- Cluster interpretation
- Saving generated results and figures
- Docker containerization and reproducibility
- Docker Hub publication and distribution

### Instructor Approval

The HCV dataset was selected from the approved dataset options in the assignment.

Since HCV primarily contains numerical laboratory measurements rather than free-text records, the team requested permission to adapt the text-specific requirements.

The course instructor approved using numerical data analysis and numerical machine learning methods instead of the text-specific analysis requirements.

Therefore, the project uses numerical feature engineering, correlation analysis, clinical measurements, Logistic Regression, Random Forest, and K-Means clustering.

---

## 2. Dataset Information

**Dataset Name:** HCV Dataset

**Source:** UCI Machine Learning Repository

**Dataset URL:**

https://archive.ics.uci.edu/dataset/571/hcv+data

### Dataset Description

The original dataset contains:

- 615 patient records
- 14 columns, including a row identifier
- 5 patient categories
- Numerical laboratory measurements
- Patient age and sex

### Dataset Features

The main features include:

- Age
- Sex
- ALB
- ALP
- ALT
- AST
- BIL
- CHE
- CHOL
- CREA
- GGT
- PROT

The target variable is `Category`, representing the patient classification.

### Patient Categories

| Category | Records |
|---|---:|
| Blood Donor | 533 |
| Suspect Blood Donor | 7 |
| Hepatitis | 24 |
| Fibrosis | 21 |
| Cirrhosis | 30 |
| **Total** | **615** |

The dataset is highly imbalanced because most records belong to the Blood Donor category.

---

## 3. Technologies Used

The following technologies and Python libraries were used:

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Scikit-learn
- JupyterLab
- Docker
- Docker Desktop
- Docker Hub
- Visual Studio Code

### Python Dependencies

The required Python libraries are listed in `requirements.txt`.

### Docker Base Image

`quay.io/jupyter/scipy-notebook:latest`

---

## 4. Project Structure

The project follows the required directory structure.

    bd-a1/
    ├── Dockerfile
    ├── requirements.txt
    ├── README.md
    ├── data/
    │   └── dataset.csv
    ├── notebook/
    │   └── analysis.ipynb
    ├── output/
    │   ├── cleaned_data.csv
    │   ├── model_metrics.txt
    │   ├── cluster_summary.txt
    │   └── figures/
    │       ├── correlation_heatmap.png
    │       ├── category_distribution.png
    │       ├── confusion_matrix.png
    │       └── group_comparison.png
    └── screenshots/

The `data` folder contains the original dataset.

The `notebook` folder contains the Python analysis notebook.

The `output` folder contains the generated datasets, model metrics, clustering summaries, and figures.

The `screenshots` folder contains evidence of Docker commands and project execution.

---

## 5. Docker Image vs Container

### Docker Image

A Docker image is a packaged environment containing the application, dependencies, configurations, and required project files.

The custom Docker image for this project is:

`bd-a1:latest`

### Docker Container

A Docker container is a running instance of a Docker image.

The container used in this project is:

`bd-a1-container`

A Docker image can be used to create multiple containers.

---

## 6. Build the Docker Image

Before building the image, Docker Desktop must be installed and running.

Open PowerShell inside the `bd-a1` project directory.

### Build Command

`docker build -t bd-a1:latest .`

This command builds the custom Docker image using the Dockerfile located in the current directory.

The image installs the required dependencies and includes the HCV dataset and analysis notebook.

### Verify the Docker Image

`docker images`

The image `bd-a1:latest` should appear in the list.

---

## 7. Run the Docker Container

Run the following command in PowerShell from the `bd-a1` directory:

`docker run -d --name bd-a1-container -p 8888:8888 -v "${PWD}/output:/home/jovyan/work/bd-a1/output" -v "${PWD}/notebook:/home/jovyan/work/bd-a1/notebook" bd-a1:latest`

This command:

- Creates a container named `bd-a1-container`
- Runs the container in detached mode
- Maps host port 8888 to container port 8888
- Mounts the output folder
- Mounts the notebook folder
- Starts the Jupyter environment

### Verify the Running Container

`docker ps`

The container should appear with a running status.

If a previous container with the same name exists, stop and remove it before running the new container.

`docker stop bd-a1-container`

`docker rm bd-a1-container`

Removing the container does not delete files stored in the host's bind-mounted directories.

---

## 8. Port Mapping

Docker uses the following port mapping format:

`HOST_PORT:CONTAINER_PORT`

In this project:

`-p 8888:8888`

The first port represents the host computer.

The second port represents the port inside the Docker container.

This allows JupyterLab running inside Docker to be accessed through the host computer.

For the team demonstration, host port 8889 is used to avoid possible conflicts.

`-p 8889:8888`

---

## 9. Open JupyterLab

After starting the container, run:

`docker exec bd-a1-container jupyter server list`

Alternatively:

`docker logs bd-a1-container`

Copy the JupyterLab URL containing the authentication token and open it in a web browser.

The URL will have a format similar to:

`http://127.0.0.1:8888/lab?token=YOUR_TOKEN`

The authentication token should be kept private.

Inside JupyterLab, open:

`notebook/analysis.ipynb`

To execute the complete notebook, select:

**Kernel → Restart Kernel and Run All Cells**

The notebook should run from beginning to end without errors.

---

## 10. Bind Mount and Persistent Storage

A bind mount connects a directory on the host computer with a directory inside the Docker container.

The project uses bind mounts for:

- `output/`
- `notebook/`

This ensures that generated CSV files, metrics, figures, and notebook modifications remain accessible on the host computer.

Even if the Docker container is removed, the files remain in the mounted host directories.

### Bind Mount vs Docker Volume

A bind mount uses a specific directory on the host computer.

A Docker volume is managed by Docker and provides persistent storage independently of a specific host folder path.

For this project, bind mounts are used because the generated files must be accessible directly from the project directory.

---

## 11. Data Analysis and Preprocessing

The dataset was analyzed using Pandas.

The following operations were performed:

- Displaying the first five rows
- Checking dataset shape
- Displaying column names
- Checking data types
- Displaying dataset information
- Calculating descriptive statistics
- Identifying missing values
- Checking duplicate rows
- Using `loc`, `iloc`, and `np.r_`
- Creating transformed features
- Performing sampling
- Computing numerical correlations

### Missing Values

A total of 31 missing values were identified.

| Column | Missing Values |
|---|---:|
| ALB | 1 |
| ALP | 18 |
| ALT | 1 |
| CHOL | 10 |
| PROT | 1 |
| **Total** | **31** |

Missing numerical values were replaced using the median of each affected column in the exploratory cleaned dataset.

For supervised machine learning, preprocessing was fitted using training data only to prevent data leakage.

### Duplicate Records

No duplicate records were found.

### Data Cleaning Results

**Original shape:** (615, 14)

**Cleaned shape:** (615, 13)

The unnecessary `Unnamed: 0` column was removed.

All 615 patient records were retained.

The cleaned dataset was saved as:

`output/cleaned_data.csv`

---

## 12. Data Transformations

Three transformations were performed.

### Sex Encoding

The `Sex` column was converted into numerical values:

- Male = 1
- Female = 0

A new feature named `Sex_Encoded` was created.

### Age Group Creation

Patients were divided into four age groups:

- Young
- Adult
- Middle Aged
- Senior

The `pd.cut()` function was used to create the age groups.

### AST/ALT Ratio

A new numerical feature was created using:

`AST_ALT_Ratio = AST / ALT`

These transformations support exploratory analysis and feature creation.

---

## 13. Sampling Methods

Three sampling methods were demonstrated.

### Simple Random Sampling

A random sample containing approximately 20% of the dataset was selected.

This method gives individual records an equal probability of being selected.

### Stratified Sampling

Records were sampled proportionally according to the `Category` column.

This method helps preserve the original category distribution.

### Cluster Sampling

Patients were grouped using age categories, and one complete group was randomly selected.

This illustrates cluster sampling, although the dataset does not contain natural sampling clusters such as hospitals or clinics.

The category distributions were compared across the original and sampled datasets.

---

## 14. Correlation Analysis

A correlation matrix was calculated using numerical features.

A correlation heatmap was generated and saved as:

`output/figures/correlation_heatmap.png`

### Strongest Correlations

| Features | Correlation |
|---|---:|
| ALB and PROT | +0.550 |
| AST and GGT | +0.491 |
| ALP and GGT | +0.440 |
| CHE and CHOL | +0.420 |
| ALB and CHE | +0.376 |

These results indicate positive linear relationships of different strengths.

### Weakest Correlations

| Features | Correlation |
|---|---:|
| CHE and CREA | -0.011157 |
| CHOL and GGT | -0.007185 |
| Age and ALT | -0.005690 |
| ALB and CREA | -0.001594 |
| ALB and ALT | +0.001444 |

Correlations close to zero indicate little or no linear relationship.

### Correlation Interpretation

The strongest positive relationship was found between ALB and PROT, with a correlation coefficient of approximately 0.550.

AST and GGT also demonstrated a moderate positive linear relationship.

The weakest linear relationship was between ALB and ALT.

Correlation does not imply causation because relationships between variables may be influenced by additional factors.

---

## 15. Supervised Machine Learning — Logistic Regression

### Model

Logistic Regression was used to classify patient categories using numerical and categorical clinical features.

The dataset was divided into:

- 80% training data
- 20% testing data

Stratified splitting was applied to preserve category proportions.

### Training and Testing

- Training records: 492
- Testing records: 123
- Number of original input features: 12
- Number of features after preprocessing: 13

### Preprocessing

The preprocessing pipeline included:

1. Missing value imputation using the median
2. One-Hot Encoding for categorical features
3. StandardScaler for numerical features

The preprocessing operations were fitted using training data to avoid information leakage from the test set.

### Model Evaluation

| Metric | Result |
|---|---:|
| Accuracy | 92.68% |
| Macro Precision | 67.71% |
| Macro Recall | 84.40% |
| Macro F1-Score | 73.31% |

The model correctly classified 114 of the 123 test records.

### Classification Performance

The classification report was generated using Scikit-learn.

Evaluation metrics included:

- Accuracy
- Precision
- Recall
- F1-score
- Confusion matrix

### Model Limitations

The dataset is highly imbalanced, with most records belonging to the Blood Donor category.

Some minority categories contain very few testing records.

As a result, performance estimates for rare categories are less reliable.

### Model Outputs

The classification results are saved in:

`output/model_metrics.txt`

The confusion matrix is saved as:

`output/figures/confusion_matrix.png`

---

## 16. Bonus — Supervised Machine Learning Model Comparison

### Bonus Objective

An additional supervised machine learning model was implemented to compare its performance with Logistic Regression.

The two models are:

1. Logistic Regression
2. Random Forest Classifier

Both models were evaluated using the same training and testing datasets.

### Random Forest Model

Random Forest is an ensemble machine learning algorithm that combines predictions from multiple decision trees.

The Random Forest model was trained using the following configuration:

- `n_estimators = 200`
- `random_state = 42`
- `class_weight = balanced`

### Model Comparison Results

| Metric | Logistic Regression | Random Forest |
|---|---:|---:|
| Accuracy | 92.68% | 95.12% |
| Macro Precision | 67.71% | 61.63% |
| Macro Recall | 84.40% | 58.67% |
| Macro F1-Score | 73.31% | 60.00% |

### Accuracy Comparison

Random Forest achieved higher overall accuracy.

- Logistic Regression Accuracy: 92.68%
- Random Forest Accuracy: 95.12%

This indicates that Random Forest classified a greater percentage of the test records correctly.

However, accuracy alone is not sufficient for evaluating an imbalanced dataset.

### Macro Precision Comparison

Logistic Regression achieved higher macro precision:

- Logistic Regression: 67.71%
- Random Forest: 61.63%

### Macro Recall Comparison

Logistic Regression achieved higher macro recall:

- Logistic Regression: 84.40%
- Random Forest: 58.67%

This indicates better average recall across the five patient categories for Logistic Regression.

### Macro F1-Score Comparison

Logistic Regression achieved a higher macro F1-score:

- Logistic Regression: 73.31%
- Random Forest: 60.00%

Macro F1-score gives equal importance to each patient category regardless of its number of records.

### Bonus Interpretation

Although Random Forest achieved higher overall accuracy, Logistic Regression achieved better macro precision, macro recall, and macro F1-score.

The dataset contains many more Blood Donors than patients in the other disease categories.

Therefore, macro F1-score is especially important when comparing classification performance across all categories.

### Bonus Conclusion

Logistic Regression was selected as the preferred model based on macro F1-score and balanced performance across the patient categories.

However, the small number of minority-class test records limits the reliability of the estimates.

A larger and more balanced dataset would help provide a more reliable comparison.

### Bonus Output

The complete model comparison is saved inside:

`output/model_metrics.txt`

The notebook includes the Random Forest training code, model evaluation, and comparison table.

---

## 17. K-Means Clustering

K-Means clustering was applied as an unsupervised machine learning method.

The model groups records based on numerical and encoded features without using the disease category labels during training.

### Cluster Selection

Different numbers of clusters were tested using silhouette scores.

| Number of Clusters (k) | Silhouette Score |
|---|---:|
| 2 | 0.5806 |
| 3 | 0.1236 |
| 4 | 0.1271 |
| 5 | 0.1360 |
| 6 | 0.1247 |

The highest silhouette score among the tested values was achieved with:

**k = 2**

### Final Clustering Results

| Cluster | Number of Records |
|---|---:|
| Cluster 0 | 36 |
| Cluster 1 | 579 |
| **Total** | **615** |

### Cluster 0 Interpretation

Cluster 0 contains a higher proportion of Cirrhosis patients.

It also shows:

- Higher average AST measurements
- Higher average GGT measurements
- Higher average CREA measurements
- Lower average ALB measurements
- Lower average PROT measurements

Cluster 0 contains 36 records, including 23 Cirrhosis cases.

### Cluster 1 Interpretation

Cluster 1 contains most of the Blood Donor records.

It generally shows less abnormal average laboratory measurements.

Cluster 1 contains 579 records, including 529 Blood Donors.

### Clustering Conclusion

The clustering results demonstrate that K-Means can identify groups with different laboratory measurement patterns.

However, the clusters do not exactly correspond to disease categories because K-Means is an unsupervised learning algorithm.

The results are exploratory and should not be interpreted as medical diagnoses.

### Clustering Output

`output/cluster_summary.txt`

---

## 18. Data Visualization

The project generates the following four figures.

### Correlation Heatmap

`correlation_heatmap.png`

Displays correlations among numerical features.

### Category Distribution

`category_distribution.png`

Shows the number of records belonging to each patient category.

### Confusion Matrix

`confusion_matrix.png`

Visualizes correct and incorrect classification predictions.

### Group Comparison

`group_comparison.png`

Compares average ALT, AST, and GGT measurements between Blood Donors and Cirrhosis patients.

All four figures are saved inside:

`output/figures/`

---

## 19. Docker Container Lifecycle Commands

### Display Docker Images

`docker images`

### Display Running Containers

`docker ps`

### Display All Containers

`docker ps -a`

### Display Container Logs

`docker logs bd-a1-container`

### Inspect Container

`docker inspect bd-a1-container`

### Stop Container

`docker stop bd-a1-container`

### Remove Container

`docker rm bd-a1-container`

Screenshots of Docker commands and successful execution can be stored inside the `screenshots/` folder.

---

## 20. Docker Hub Distribution

The custom Docker image was successfully uploaded to Docker Hub.

### Docker Hub Information

**Docker Hub Username:** abdelrhmanmohamed222323

**Repository:** abdelrhmanmohamed222323/bd-a1

**Image Tag:** latest

**Repository URL:**

https://hub.docker.com/r/abdelrhmanmohamed222323/bd-a1

### Tag the Docker Image

`docker tag bd-a1:latest abdelrhmanmohamed222323/bd-a1:latest`

### Push the Image to Docker Hub

`docker push abdelrhmanmohamed222323/bd-a1:latest`

### Updating the Published Image

Whenever the notebook or project files are modified, the Docker image should be rebuilt and uploaded again to include the latest changes.

In this project, the Random Forest bonus was added after the original image publication.

To publish the updated notebook, run the following commands from the `bd-a1` folder after saving the notebook:

**Build the updated image:**

`docker build -t bd-a1:latest .`

**Apply the Docker Hub tag:**

`docker tag bd-a1:latest abdelrhmanmohamed222323/bd-a1:latest`

**Upload the updated image:**

`docker push abdelrhmanmohamed222323/bd-a1:latest`

This ensures that the published image includes the updated machine learning comparison.

### Pull the Image on Another Computer

`docker pull abdelrhmanmohamed222323/bd-a1:latest`

### Run the Published Image

`docker run -d --name bd-a1-team-test -p 8889:8888 abdelrhmanmohamed222323/bd-a1:latest`

### Verify the Running Container

`docker ps`

### Verify the Dataset

`docker exec bd-a1-team-test ls /home/jovyan/work/bd-a1/data`

Expected file:

`dataset.csv`

### Verify JupyterLab

`docker logs bd-a1-team-test`

Open the JupyterLab URL using host port 8889 and the authentication token from the server logs.

Open `notebook/analysis.ipynb` and execute the notebook.

---


### Verification Purpose

To demonstrate that the custom Docker image can be downloaded and executed independently on another computer.

This demonstrates that the project can be reproduced without depending on the original developer's machine.

### Verification Procedure

The following procedure can be used during the assignment discussion.

### Step 1 — Pull the Image

Open PowerShell and run:

`docker pull abdelrhmanmohamed222323/bd-a1:latest`

### Step 2 — Create an Output Folder

Run:

`mkdir bd-a1-team-test`

`cd bd-a1-team-test`

`mkdir output`

### Step 3 — Run the Container

Run:

`docker run -d --name bd-a1-team-test -p 8889:8888 -v "${PWD}/output:/home/jovyan/work/bd-a1/output" abdelrhmanmohamed222323/bd-a1:latest`

### Step 4 — Verify the Running Container

`docker ps`

Confirm that `bd-a1-team-test` is running.

### Step 5 — Verify the Dataset

`docker exec bd-a1-team-test ls /home/jovyan/work/bd-a1/data`

Expected result:

`dataset.csv`

### Step 6 — Open JupyterLab

`docker logs bd-a1-team-test`

Copy the JupyterLab authentication token and open the server in a browser using host port 8889.

### Step 7 — Execute the Notebook

Open:

`notebook/analysis.ipynb`

Select:

**Kernel → Restart Kernel and Run All Cells**

Verify that the notebook executes successfully.

### Step 8 — Verify Generated Outputs

`docker exec bd-a1-team-test ls /home/jovyan/work/bd-a1/output`

Verify that the following files are generated:

- cleaned_data.csv
- model_metrics.txt
- cluster_summary.txt
- figures folder

### Verification Screenshots

The following screenshots can be collected during the independent verification:

- `teammate_docker_pull.png`
- `teammate_docker_ps.png`
- `teammate_jupyter.png`
- `teammate_notebook_execution.png`

These screenshots can be presented during the assignment discussion.

---

## 22. Reproducibility Instructions

To reproduce the project from the local project files:

1. Install and start Docker Desktop.
2. Obtain the complete `bd-a1` project directory.
3. Open PowerShell inside `bd-a1`.
4. Build the custom Docker image.
5. Run the container with the provided bind-mount command.
6. Open JupyterLab using the authentication URL.
7. Open `notebook/analysis.ipynb`.
8. Select **Kernel → Restart Kernel and Run All Cells**.
9. Verify that every cell executes without errors.
10. Check that the required output files and figures are generated.
11. Confirm that the generated files remain available on the host computer.

For reproduction from Docker Hub, pull the updated published image and follow the commands in Sections 20 and 21.

### Verification of Model Results

The notebook should reproduce the model evaluation and clustering results using the same random seeds and data.

The expected results include approximately:

- Logistic Regression Accuracy: 0.9268
- Logistic Regression Macro F1-Score: 0.7331
- Random Forest Accuracy: 0.9512
- Random Forest Macro F1-Score: 0.6000
- Best K-Means k: 2
- K-Means Silhouette Score: 0.5806

Small numerical differences may occur if different dependency versions are used.

---

## 23. Instructor Approval and Project Limitations

### Instructor Approval

The HCV dataset was selected from the approved dataset options for CSCI461 Assignment 1.

Since the dataset mainly contains numerical clinical measurements rather than free-text records, permission was requested to adapt the text-analysis requirements.

The course instructor approved using numerical data analysis and numerical machine learning for the HCV dataset.

Accordingly, the project uses:

- Numerical data preprocessing
- Feature engineering
- Correlation analysis
- Category distribution and group comparisons
- Logistic Regression classification
- Random Forest classification
- Supervised model comparison
- K-Means clustering
- Model evaluation and visualization

### Project Limitations

The dataset is highly imbalanced, with Blood Donors representing most records.

Some disease categories have very few observations, which may affect model evaluation.

Although Random Forest achieved higher overall accuracy, Logistic Regression achieved better macro F1-score.

The K-Means clustering experiment identified two groups with different laboratory measurement patterns.

These results are exploratory and should not be interpreted as clinical diagnoses.

---

## 24. Conclusion

This project demonstrates the practical application of Python, Pandas, numerical data preprocessing, visualization, supervised classification, and unsupervised clustering within a Docker environment.

The Logistic Regression model achieved an accuracy of **92.68%**, while Random Forest achieved **95.12%** on the held-out test set.

However, Logistic Regression achieved the higher macro F1-score, indicating better average classification performance across the patient categories under this evaluation.

The bonus comparison demonstrates why different evaluation metrics should be considered when assessing machine learning models on imbalanced datasets.

K-Means clustering identified two groups with different laboratory measurement patterns.

Docker was used to package the environment, run JupyterLab, preserve generated outputs using bind mounts, and distribute the custom image through Docker Hub.

The project demonstrates the importance of reproducible data analysis, machine learning evaluation, and portable computing environments.

The Docker Hub verification procedure is documented for independent demonstration during the assignment discussion.

---

## 25. References

1. UCI Machine Learning Repository — HCV Dataset  
   https://archive.ics.uci.edu/dataset/571/hcv+data

2. Docker Documentation  
   https://docs.docker.com/

3. JupyterLab Documentation  
   https://jupyterlab.readthedocs.io/

4. Pandas Documentation  
   https://pandas.pydata.org/docs/

5. Scikit-learn Documentation  
   https://scikit-learn.org/stable/
