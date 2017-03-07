 //
//  FileOperation.m
//  沙盒操作demo
//
//  Created by 王馨仪 on 16/5/31.
//  Copyright © 2016年 王馨仪. All rights reserved.
//

#import "FileOperation.h"

static FileOperation *cata;
static NSArray *paths ;
static NSString *testDirectory;
@implementation FileOperation





/**
 *  获取沙盒中Documents文件夹的路径
 *
 *  @return Documents文件夹的路径
 */

+(NSString *)getDocumentsPath{

    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *path = [paths objectAtIndex:0];
    
    return path;

}

+(NSString *)getNSCachesDirectory{
    
    paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    
    NSString *path = [paths objectAtIndex:0];
    
    return path;
    
}



/**
 *  获得Documents下子文件（夹）的路径
 *
 *  @param subdirectoryName 要获得路径的文件名称
 *
 *  @return  文件路径
 */

+(NSString*)getDocumentsSubdirectoryPath:(NSString *)subdirectoryName{
    
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *path = [paths objectAtIndex:0];
    
    NSString * subdirectoryPath = [path stringByAppendingPathComponent:subdirectoryName];

    return subdirectoryPath;

}


/**
 *  在Documents目录下创建名字为 DirectoryName的文件夹
 *
 *  @param DirectoryName 你要创建的文件夹的名字
 *
 *  @return 新文件夹的目录
 */
+(NSString *)createDirectoryInDocumentsNamed:(NSString *)directoryName{

    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];

    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    testDirectory = [path stringByAppendingPathComponent:directoryName];
    
    
    [fileManager createDirectoryAtPath:testDirectory withIntermediateDirectories:YES attributes:nil error:nil];


    return testDirectory;
}
/**
 *  在 directoryName 目录下新创建一个名为FileName 的文件夹
 *
 *  @param fileName      新建的文件夹的名称
 *  @param directoryName 上一级的目录
 *  @return 新文件夹的目录
 */
+(NSString *)createFileNamed:(NSString *)fileName inDirectory:(NSString *)directoryName{

    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    testDirectory = [directoryName stringByAppendingPathComponent:fileName];
    
    
    [fileManager createDirectoryAtPath:testDirectory withIntermediateDirectories:YES attributes:nil error:nil];

    return testDirectory;


}


/**
 *  将数组转 存到制定路径 文件名字
 *
 *  @param fileName      文件名 (注意需要传入文件后缀 如：@“周杰伦.avi”)
 *  @param directoryName 存放在哪个目录
 *  @param content    要存储的内容
 */
+(void)createFileNamed:(NSString *)fileName inDirectory:(NSString *)directoryName andContent:(NSString  *)content{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *txt =  [directoryName stringByAppendingPathComponent:fileName];
    
    //创建文件fileName文件名称，contents文件的内容，如果开始没有内容可以设置为nil，attributes文件的属性，初始为nil
    [fileManager createFileAtPath:txt contents:[[NSString stringWithFormat:@"%@",content] dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    
}





/**
 *   创建一个名为FileName 的文件在DirectoryName 目录下 并且写入内容
 *
 *  @param FileName      文件名 (注意需要传入文件后缀 如：@“周杰伦.avi”)
 *  @param DirectoryName 存放在哪个目录
 *  @param Contents      内容
 */
+(void)createFileNamed:(NSString *)fileName inDirectory:(NSString *)directoryName andWriteIn:(NSString *)contents{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *txt =  [directoryName stringByAppendingPathComponent:fileName];

    //创建文件fileName文件名称，contents文件的内容，如果开始没有内容可以设置为nil，attributes文件的属性，初始为nil
    [fileManager createFileAtPath:txt contents:[contents dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];

}


/**
 *  查看目录下所有文件 （包括子目录）
 *
 *  @param path 要查看的目录
 *
 *  @return 目录下所有文件名
 */
+(NSArray *)getAllFileNameIncludeSubdirectory:(NSString *)path{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *file = [fileManager subpathsOfDirectoryAtPath:path error:nil];
    
    return file;

}



/**
 *  查看目录下所有文件 （不包括子目录）
 *
 *  @param path 要查看的目录
 *
 *  @return 目录下所有文件名
 */
+(NSArray *)getAllFileName:(NSString *)path{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];

    NSArray *arr =  [fileManager contentsOfDirectoryAtPath:path error:nil];

    return arr;

}



/**
 *  在某个目录下是否存在某个文件（夹）
 *
 *  @param fileName 待查询的文件（夹）名称 注意文件后缀
 *  @param path     查询的文件路径
 *
 *  @return 是否存在
 */
+(BOOL)fileExists:(NSString *)fileName AtPath:(NSString*)path{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *txt =  [path stringByAppendingPathComponent:fileName];
    
    BOOL have = [fileManager fileExistsAtPath:txt];
    
    return have;
    
}

/**
 *  删除某个目录下的某个文件（夹）
 *
 *  @param fileName 待删除的文件名称
 *  @param path     文件所在路径
 */
+(void)removeFile:(NSString *)fileName AtPath:(NSString*)path{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *txt =  [path stringByAppendingPathComponent:fileName];
    
    [fileManager removeItemAtPath:txt error:nil];
    
    
}


@end
