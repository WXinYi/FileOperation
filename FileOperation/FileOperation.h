
//
//  FileOperation.h
//  沙盒操作demo
//
//  Created by 王馨仪 on 16/5/31.
//  Copyright © 2016年 王馨仪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileOperation : NSObject


/**
 *  获取沙盒中Documents文件夹的路径
 *
 *  @return Documents文件夹的路径
 */
+(NSString *)getDocumentsPath;

/**
 *  获取沙河中临时文件夹
 *
 *  @return CachesDirectory路径
 */
+(NSString *)getNSCachesDirectory;

/**
 *  在 directoryName 目录下新创建一个名为FileName 的文件夹
 *
 *  @param fileName      新建的文件夹的名称
 *  @param directoryName 上一级的目录
 *  @return 新文件夹的目录
 */
+(NSString *)createFileNamed:(NSString *)fileName inDirectory:(NSString *)directoryName;



/**
 *  在Documents目录下创建名字为 DirectoryName的文件夹
 *
 *  @param DirectoryName 你要创建的文件夹的名字
 *
 *  @return 新文件夹的目录
 */
+(NSString *)createDirectoryInDocumentsNamed:(NSString *)directoryName;


/**
 *  将内容 存到指定路径 文件名字
 *
 *  @param fileName      文件名 (注意需要传入文件后缀 如：@“周杰伦.avi”)
 *  @param directoryName 存放在哪个目录
 *  @param content    要存储的内容
 */
+(void)createFileNamed:(NSString *)fileName inDirectory:(NSString *)directoryName andContentArray:(NSString *)content;


/**
 *   创建一个名为FileName 的文件在DirectoryName 目录下 并且写入内容
 *
 *  @param FileName      文件名 (注意需要传入文件后缀 如：@“周杰伦.avi”)
 *  @param DirectoryName 存放在哪个目录
 *  @param Contents      内容
 */
+(void)createFileNamed:(NSString *)fileName inDirectory:(NSString *)directoryName andWriteIn:(NSString *)contents;


/**
 *  查看目录下所有文件 （包括子目录）
 *
 *  @param path 要查看的目录
 *
 *  @return 目录下所有文件名
 */
+(NSArray *)getAllFileNameIncludeSubdirectory:(NSString *)path;



/**
 *  查看目录下所有文件 （不包括子目录）
 *
 *  @param path 要查看的目录
 *
 *  @return 目录下所有文件名
 */
+(NSArray *)getAllFileName:(NSString *)path;



/**
 *  在某个目录下是否存在某个文件（夹）
 *
 *  @param fileName 待查询的文件（夹）名称 注意文件后缀
 *  @param path     查询的文件路径
 *
 *  @return 是否存在
 */
+(BOOL)fileExists:(NSString *)fileName AtPath:(NSString*)path;


/**
 *  删除某个目录下的某个文件（夹）
 *
 *  @param fileName 待删除的文件名称
 *  @param path     文件所在路径
 */
+(void)removeFile:(NSString *)fileName AtPath:(NSString*)path;

@end
