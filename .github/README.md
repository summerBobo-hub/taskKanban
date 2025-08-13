# GitHub Actions 自动部署配置

本项目配置了完整的CI/CD流程，支持自动编译和部署。

## 🚀 工作流文件

### 1. `deploy.yml` - 基础部署
- **触发条件**: Push到main/master分支，或创建PR
- **功能**: 自动编译和部署到GitHub Pages
- **适用场景**: 简单快速部署

### 2. `advanced-deploy.yml` - 高级部署
- **触发条件**: 
  - Push到main/master/develop分支
  - 创建标签（v*）
  - 手动触发
- **功能**: 多环境部署、代码质量检查、编译验证
- **适用场景**: 生产环境部署

## 📋 使用方法

### 自动部署
1. **Push到main分支**: 自动部署到生产环境
2. **Push到develop分支**: 自动部署到staging环境
3. **创建PR**: 自动部署预览版本
4. **创建标签**: 自动发布新版本

### 手动部署
1. 进入GitHub仓库的Actions页面
2. 选择"高级自动部署"工作流
3. 点击"Run workflow"
4. 选择部署环境（staging/production）
5. 点击"Run workflow"

## 🌍 部署环境

### Staging环境
- **分支**: develop
- **地址**: `https://username.github.io/repo/staging/`
- **用途**: 测试和预览

### Production环境
- **分支**: main/master
- **地址**: `https://username.github.io/repo/`
- **用途**: 正式发布

### PR预览
- **地址**: `https://username.github.io/repo/preview/PR编号/`
- **用途**: 代码审查和测试

## ⚙️ 配置要求

### 仓库设置
1. **启用GitHub Pages**:
   - 进入Settings > Pages
   - Source选择"GitHub Actions"

2. **权限设置**:
   - 确保Actions有写入权限
   - 检查`GITHUB_TOKEN`是否可用

### 分支保护
- 建议为main/master分支启用分支保护
- 要求PR审查通过后才能合并
- 启用状态检查

## 🔧 自定义配置

### 修改部署分支
编辑`.github/workflows/*.yml`文件中的`branches`部分：

```yaml
on:
  push:
    branches: [ main, master, develop, feature/* ]
```

### 修改Node.js版本
修改`env.NODE_VERSION`值：

```yaml
env:
  NODE_VERSION: '20'
```

### 添加环境变量
在workflow文件中添加：

```yaml
env:
  NODE_VERSION: '18'
  CUSTOM_VAR: 'value'
```

## 📊 监控和调试

### 查看部署状态
1. 进入Actions页面查看工作流执行状态
2. 点击具体的工作流查看详细日志
3. 检查部署结果和错误信息

### 常见问题
1. **编译失败**: 检查Node.js版本和依赖
2. **部署失败**: 检查GitHub Pages设置和权限
3. **缓存问题**: 清除npm缓存或使用`npm ci --prefer-offline`

## 🎯 最佳实践

1. **分支策略**: 使用main/master作为生产分支，develop作为开发分支
2. **版本管理**: 使用语义化版本标签（v1.0.0, v1.1.0等）
3. **代码质量**: 在PR中启用代码审查和自动化测试
4. **回滚策略**: 保留部署历史，支持快速回滚

## 📞 支持

如果遇到问题：
1. 检查Actions日志中的错误信息
2. 验证仓库设置和权限配置
3. 参考GitHub Actions官方文档
4. 提交Issue描述具体问题
