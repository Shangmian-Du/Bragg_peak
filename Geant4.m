% MATLAB 脚本：对xlsx数据分类并统计
clc;
clear;

% 读取 Excel 文件
filename = 'C:\Users\11425\Desktop\energy_loss_data.xlsx'; % 替换为实际文件名
data = readmatrix(filename);

% 提取列数据
firstColumn = data(:, 1); % 第一列数据
secondColumn = data(:, 2); % 第二列数据
thirdColumn = data(:, 3); % 第三列数据

% 获取第一列的唯一值（分类依据）
uniqueCategories = unique(firstColumn);

% 初始化结果存储变量
results = []; % 存放结果的矩阵
rangeStep = 10; % 区间步长

% 遍历每个分类
for i = 1:length(uniqueCategories)
    category = uniqueCategories(i); % 当前分类
    categoryMask = (firstColumn == category); % 分类掩码
    categoryData = thirdColumn(categoryMask); % 当前分类的第三列数据
    categorySecondData = secondColumn(categoryMask); % 当前分类的第二列数据

    % 计算范围区间内的求和
    maxRange = ceil(max(categoryData) / rangeStep) * rangeStep; % 最大范围
    for rangeStart = 0:rangeStep:maxRange
        rangeEnd = rangeStart + rangeStep; % 当前区间的结束值

        % 查找第三列在当前范围内的索引
        rangeMask = (categoryData >= rangeStart) & (categoryData < rangeEnd);
        sumInRange = sum(categorySecondData(rangeMask)); % 对应第二列的求和

        % 将结果存入矩阵
        results = [results; category, sumInRange, rangeStart, rangeEnd]; %#ok<AGROW>
    end
end
% 构建新表格的格式
rangeStarts = unique(results(:, 3)); % 所有区间起点（行号）
categories = unique(results(:, 1)); % 所有分类（列号）

% 初始化新表格矩阵
summaryMatrix = zeros(length(rangeStarts), length(categories));

% 填充新表格矩阵
for i = 1:size(results, 1)
    category = results(i, 1);
    rangeStart = results(i, 3);
    sumValue = results(i, 2);

    % 查找分类和区间在表格中的索引
    rowIdx = find(rangeStarts == rangeStart); % 区间对应的行号
    colIdx = find(categories == category); % 分类对应的列号

    % 填入求和结果
    summaryMatrix(rowIdx, colIdx) = sumValue;
end