Phalcon后台CMS


##### 下载对应版本的phalcon扩展
###### win
    https://github.com/phalcon/cphalcon/releases/tag/v3.3.2
###### *uix
    https://phalconphp.com/zh/download/linux
##### phalcon开发工具
    https://github.com/phalcon/phalcon-devtools.git

克隆到本地，然后添加到将目录添加到环境变量
    

##### 数据库迁移脚本的使用
     --action=s             生成数据迁移脚本 [generate|run]                                            
     --config=s             配置文件的位置                                                              
     --migrations=s         迁移脚本的目录                                                            
     --directory=s          项目目录                                         
     --table=s              表名，可填多个，用,分隔(一般对表的插入顺序有要求的需要明确指定表的写入顺序的，请明确定义)       
     --version=s            指明需要执行迁移脚本的版本号重1.0.0开始                                                              
     --descr=s              迁移说明                      
     --data=s               是否导出(导入数据)[always|oncreate]                  
     --force                是否强制重写数据                                         
     --ts-based             是否以时间戳做迁移标注                                               
     --log-in-db            是否将迁移记录写入数据库                   
     --dry                  Attempt requested operation without making changes to system (Generating only)  
     --verbose              输出debug信息(只在run模式下使用)
     --no-auto-increment    禁止使用自增长                                        
     --help                 显示帮助信息 [optional]
     
                                                     
phalcon migration run --table=admins,roles,role_admin,article_comments,articles,gallery,labels,migrations,news,news_copy,password_resets,permission_role,permissions,types,users

##### apache配置
    <VirtualHost *:80>
        ServerName test.multi-phalcon.com
        DocumentRoot "D:/lab/phalcon_multimodule_example/public"
        <Directory  "D:/lab/phalcon_multimodule_example/public/">
            Options +Indexes +Includes +FollowSymLinks +MultiViews
            AllowOverride All
            Require all granted
        </Directory>
    </VirtualHost>

##### 修改host
    127.0.0.1 test.multi-phalcon.com
    
**目前开发工具的迁移功能尚有BUG，只能导入单行数据，所以基本数据后期会补上**


