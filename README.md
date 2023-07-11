![header](https://capsule-render.vercel.app/api?type=waving&color=auto&height=200&section=header&text=NBA%20선수%20기록과%20연봉%20데이터%20분석&fontSize=50)

### :basketball: 수행기간 : 2023.03.16 ~ 2023.03.29

## :bulb: 주제
미국 프로농구 NBA 선수들의 연봉에 영향을 미치는 데이터를 분석하여 선수들의 기록이 연봉에 어떠한 영향을 주는지 분석하여 연봉이 예측 가능한 모델 생성

## 👨‍💼 팀원

<ul>
  <li>박상춘 - <a href="https://github.com/sangchun1">sangchun1</a></li>
  <li>장민수 - <a href="https://github.com/xuyite">xuyite</a></li>
</ul>

## :microscope: 수행절차 및 방법
### 데이터 개요
데이터 출처 : [kaggle.com/datasets/loganlauton/nba-players-and-team-data](https://www.kaggle.com/datasets/loganlauton/nba-players-and-team-data)
<br>
<img src="https://user-images.githubusercontent.com/121409511/228159529-b407c801-bc2f-4384-828c-9533ad29b35a.png"/>

### 데이터 전처리
<ol>
  <li>
    선수 경기기록 데이터와 선수 연봉 데이터 기간 맞추기(1990 - 2021)
    <ul><li><i>17845 건수</i></li></ul>
  </li>
  <li>
    범주형 변수(포지션) 원핫인코딩<br>
    <img src="https://user-images.githubusercontent.com/121409511/228165783-f7076292-3481-4a30-b5c5-428e4f1ecb1c.png"/>
  </li>
  <li>
    결측치 제거(연봉 데이터가 없는 선수, 시즌기록이 없는 선수 제거)
    <ul><li><i>11926 건수</i></li></ul>
  </li>
  <li>
    불필요한 컬럼 제거
    <ul><li><i>인덱스, Player, Tm, playerName, seasonStartYear, salary, Pos</i></li></ul>
  </li>
  <li>
    종속변수 컬럼명 변환(inflationAdjSalary -> salary)
  </li>
  <li>
    연봉 컬럼(salary) 숫자형으로 변환<br>
    <img src="https://user-images.githubusercontent.com/121409511/228166704-3d0a5e83-7849-4f21-b364-73b28b85e385.png"/>
  </li>
  <li>
    독립변수 스케일링 - 이상치가 많아 StandardScaler 대신 RobustScaler 사용
    <ul>
      <li>
        스케일링 전<br>
        <img src="https://user-images.githubusercontent.com/121409511/228167606-2527a370-013f-45bc-9697-0f76293619e2.png" width=50%/>
      </li>
      <li>
        스케일링 후<br>
        <img src="https://user-images.githubusercontent.com/121409511/228167611-d9470099-773d-4a93-8855-a5e510296b64.png" width=50%/>
      </li>
    </ul>
  </li>
 </ol>
 <ul><li>총 11926개의 데이터 건수와 33개의 변수( 독립변수(X) : 32, 종속변수(Y) : 1 )</li></ul>

### 상관분석
 - 밀접한 상관관계를 갖고 있는 변수들 : <strong>PTS, FG, FGA, FTA, DRB</strong>
 
 - <strong>귀무가설</strong> : 연봉과 다른 변수들 사이에 상관관계가 없다
 - <strong>대립가설</strong> : 연봉과 다른 변수들 사이에 상관관계가 있다
 - <strong>p-value = 0.000</strong>,  귀무가설을 기각하고 대립가설 채택
 - <strong>결론 : 연봉과 다른 변수들 사이에 상관관계가 있다</strong>

### 회귀분석
<img src="https://github.com/sangchun1/nba_salary/assets/121409511/55d5c5e1-9405-4b42-8492-33176b090fc6"/>

### 회귀분석 모형 비교 분석
<strong>총 6개의 모형</strong>
<ol>
  <li>Ordinary Least Squares(OLS)</li>
  <li>Linear Regression</li>
  <li>의사결정나무(Decision Tree)</li>
  <li>Support Vector Machine(SVM)</li>
  <li>랜덤 포레스트(Random Forest)</li>
  <li>인공신경망(Artificial Neural Network)</li>
</ol>
<strong>다중공선성 의심으로 의존적인 변수들 제거</strong>
<ul>
  <li>FG</li>
  <li>FGA</li>
  <li>3P</li>
  <li>3PA</li>
  <li>2P</li>
  <li>2PA</li>
  <li>FT</li>
  <li>FTA</li>
  <li>TRB</li>
</ul>
<strong>후진제거법으로 유의하지 않은 변수들 제거</strong>
<ul>
  <li>GS</li>
  <li>FG%</li>
  <li>3P%</li>
  <li>2P%</li>
  <li>BLK</li>
  <li>TOV</li>
  <li>PF</li>
</ul>
<strong>분석 방법:</strong>
<ol>
  <li>모델 테스트</li>
  <li>GridSearchCV 또는 RandomSearchCV로 최적의 파라미터 탐색</li>
  <li>최적의 파라미터로 모델 생성</li>
  <li>정확도 : R-squared, 오차 : 평균 제곱근 오차(RMSE)</li>
</ol>

## :bar_chart: 결과물
<img src="https://user-images.githubusercontent.com/121409511/228169963-119a9b25-f756-4a2e-a692-5185f371a7fd.png"/>

더 자세한 결과물 : [발표자료](https://docs.google.com/presentation/d/1zm7ERAnbzVLzFRGdovSC0qN0e-pP-3u6laDKWe4dpZY/edit?usp=sharing)

## :seedling: 사용 언어
<div align="left">
  <img src="https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white"/>
  <img src="https://img.shields.io/badge/R-276DC3?style=flat-square&logo=r&logoColor=white"/>
</div>

## :open_file_folder: 사용 라이브러리
<div align="left">
  <img src="https://img.shields.io/badge/pandas-%23150458.svg?style=flat-square&logo=pandas&logoColor=white"/>
  <img src="https://img.shields.io/badge/numpy-%23013243.svg?style=flat-square&logo=numpy&logoColor=white"/>
  <img src="https://img.shields.io/badge/Matplotlib-%23ffffff.svg?style=flat-square&logo=Matplotlib&logoColor=black"/>
  <img src="https://img.shields.io/badge/seaborn-6478a6?style=flat-square&logo=seaborn&logoColor=white"/>
</div>
<div align="left">
  <img src="https://img.shields.io/badge/SciPy-%230C55A5.svg?style=flat-square&logo=scipy&logoColor=%white"/>
  <img src="https://img.shields.io/badge/scikit--learn-%23F7931E.svg?style=flat-square&logo=scikit-learn&logoColor=white"/>
  <img src="https://img.shields.io/badge/statsmodels-3f51b5?style=flat-square&logo=statsmodels&logoColor=white"/>
  <img src="https://img.shields.io/badge/Keras-%23D00000.svg?style=flat-square&logo=Keras&logoColor=white"/>
</div>

## :computer: 사용 툴
<div align="left">
  <img src="https://img.shields.io/badge/Visual Studio Code-007ACC?style=flat-square&logo=visualstudiocode&logoColor=white"/>
  <img src="https://img.shields.io/badge/Jupyter-F37626?style=flat-square&logo=jupyter&logoColor=white"/>
  <img src="https://img.shields.io/badge/RStudio-4285F4?style=flat-square&logo=rstudio&logoColor=white"/>
</div>

![Footer](https://capsule-render.vercel.app/api?type=waving&color=auto&height=150&section=footer)
