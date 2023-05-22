# 基于SEIR模型的疫情感染人数变化预测

本项目为2019年华南理工大学吴贤铭智能工程学院学院计算机程序设计导论课程设计。任务描述见任务书。程序架构见架构书。

## Introduction

This program can predicted the change of confirm cases of epidemic 
or predict the change of confirm cases in the future based on available data

## Operating environment

matlab 2018 or higher version

## Structure

Task1:Task1.m
Tsak2:compara_Realdata.m, compara_Simulateddata.m, dofmincon.m, Getdata.m

## The use of this program

- Task1: Run Task1.m directly
- Task2: 

1. Open dofmincon.m and input half of the available data in the "data" array
2. Run the program and get predicted parameters in y, y(1)=beta, y(2)=gamma, y(3)=alpha, y(4)=S0
3. Open compara_Realdata.m and input all of the available data in the "C" array
4. Input predicted parameters and run the program

## Attention

You have better to open all programs related to specific task2 in the same time.

To get more detail, please read the appendix in the report.


