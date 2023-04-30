基于SVF框架设计的FreeMemNotOnHeapChecker。

launch.json中能用FreeMemNotOnHeapChecker检测ll文件，若ll文件有CWE590缺陷，则会报出路径结果。（保留了本环境的json文件，做参考）

CMakeLists.txt中能用FreeMemNotOnHeapChecker批量检测ll文件，判断checker质量。

了解、学习、使用SVF请访问SVF[https://github.com/SVF-tools/SVF](url)
TIPS：（由于修改了路径搜索和路径约束添加部分算法，DoubleFreeChecker，LeakChecker，fileChecker遇到全局变量时可能出错）。

