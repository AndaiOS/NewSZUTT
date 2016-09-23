## 文件结构 ##
> * Resource 图片文件夹
> * NewSZUTT 主要的类文件夹

## NewSZUTT 文件夹结构 ##
> * Addtion 一些 categroy 和 单独的类
> * Classes 主要的类文件
> * Model 一些模型文件

## Classes 文件夹 ##
> * DiscoverPage 发现板块
> * LoginPage 登陆注册板块
> * ProfilePage 个人板块
> * LessonPage 课程首页板块


#### LessonPage 
1. LessonViewController 是课程首页类，负责把后台传送的 json 按照我的坐标系进行转换成课程表的样式，同时如果是旁听的话加上旁听的 icon
2. NewRecommondViewController 是课程推荐类，使用了 github 上的一个开源下拉列表菜单，获取了经纬度，过滤了结果
3. LessonDetailViewController 是课程详情类，有一个隐藏 view 的上滑下滑动画

#### DiscoverPage
1. DiscoverViewController 有一个横向 scrollView 左右滑动
2. DiscoverPage 的 View 比较多 

## Model 文件夹 ##
1. HttpManager 是单例模式的网络处理类
2. DataDefines 是定义的头文件，网络请求的接口
3. Define 也是头文件，是另一些数据的定义
