# 🏠 Predicting House Prices & iBuyer Profitability

This repository contains a two-part **Modern Analytics / Machine Learning project** that focuses on:

1. **Predicting residential house prices** using linear regression and deep neural networks (MLP)
2. **Evaluating the profitability of an iBuyer business model** under different behavioral and selection scenarios

The project combines **modeling, regularization, bias analysis, and business decision evaluation**, bridging machine learning performance with real-world economic implications.

---

## 📂 Repository Structure

```text
.
├── Case_1_(Part_I)_HousePricePrediction(Exercises).ipynb   # Part I: Data prep + baseline & deep models
├── Case1Part2.ipynb                                       # Part II: Best model + iBuyer profit analysis
├── train.csv                                              # Training data
├── test.csv                                               # Validation / test data
├── Predicting House Prices Part 2 (1).pdf                 # Final written report (Part II)
└── README.md                                              # Project overview (this file)
```

---

## 🔍 Part I — House Price Prediction

**Goal:** Build and compare models to accurately predict house sale prices.

### Models Implemented

* **Linear Regression (baseline)**
* **Multi-Layer Perceptrons (MLP)** with increasing depth

  * 2 hidden layers: `256 → 128`
  * 4 hidden layers: `512 → 256 → 128 → 64`
* **Regularization techniques**

  * L2 (weight decay)
  * Dropout (20% and 30%)

### Evaluation Metric

* **Median Error Rate (MER)** on validation data

### Key Findings

* Linear regression performs poorly (MER ≈ **13.2%**)
* Deep learning captures nonlinear structure effectively
* Best-performing architecture uses:

  * 4 hidden layers
  * Dropout = **30%**
  * Mild L2 regularization
* Final validation MER improves to **≈ 5.2%**

---

## 💼 Part II — iBuyer Business Model Evaluation

**Goal:** Translate prediction accuracy into **financial outcomes** for an iBuyer (instant home buyer).

The iBuyer:

* Makes offers based on predicted prices
* Targets a fixed profit margin (α = 12%)
* Faces selective acceptance from homeowners

### Questions Analyzed

1. **Prediction error bias** (overall)
2. Profit if *all* offers were accepted
3. Profit when *only accepted* offers are considered
4. Bias conditional on acceptance

### Core Results

| Scenario             | Avg. Profit |
| -------------------- | ----------- |
| All offers accepted  | **+15.14%** |
| Only accepted offers | **−6.07%**  |

### Key Insight 🚨

Owner selectivity creates **adverse selection**:

* Accepted offers are systematically overpriced
* Conditional prediction bias increases sharply
* Even accurate ML models can lead to losses when **human behavior** is ignored

This highlights a critical lesson:

> **Predictive accuracy ≠ Business profitability**

---

## 📊 Key Concepts Demonstrated

* Deep learning vs. linear models
* Overfitting and generalization
* Bias vs. variance tradeoff
* Regularization (L2, dropout)
* Selection bias & conditional bias
* ML-driven decision-making under strategic behavior

---

### Execution Order

1. Run `Case_1_(Part_I)_HousePricePrediction(Exercises).ipynb`
2. Run `Case1Part2.ipynb`

---

## ✨ Takeaway

This project demonstrates that **machine learning models must be evaluated not only on predictive metrics, but also on downstream economic consequences**. Incorporating behavioral responses is essential for real-world deployment.

Feel free to explore, extend, or adapt this project for:

* Real estate analytics
* ML-driven pricing
* Risk & bias analysis
* iBuyer / marketplace strategy research
