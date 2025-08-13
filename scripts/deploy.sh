#!/bin/bash

# 本地部署脚本
# 用于测试编译和部署流程

set -e

echo "🚀 开始本地部署流程..."

# 检查Node.js版本
echo "📋 检查环境..."
NODE_VERSION=$(node --version)
echo "Node.js版本: $NODE_VERSION"

# 安装依赖
echo "📦 安装依赖..."
npm ci

# 清理输出目录
echo "🧹 清理输出目录..."
rm -rf dist/

# 编译项目
echo "🔨 编译项目..."
npm run build

# 检查编译结果
echo "✅ 验证编译结果..."
if [ ! -f "dist/index.html" ]; then
    echo "❌ 编译失败：未找到dist/index.html文件"
    exit 1
fi

# 显示文件信息
echo "📁 编译结果:"
ls -la dist/
echo "📊 文件大小: $(du -sh dist/)"

# 本地预览（可选）
if [ "$1" = "--preview" ]; then
    echo "🌐 启动本地预览服务器..."
    echo "预览地址: http://localhost:8000"
    echo "按 Ctrl+C 停止服务器"
    cd dist && python3 -m http.server 8000
else
    echo "🎉 本地部署完成！"
    echo "预览地址: file://$(pwd)/dist/index.html"
    echo "或运行: ./scripts/deploy.sh --preview 启动本地服务器"
fi
