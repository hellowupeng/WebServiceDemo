//
//  MyViewController.m
//  WebServiceDemo
//
//  Created by gaiaworks on 16/5/1.
//  Copyright © 2016年 gaiaworks. All rights reserved.
//

#import "MyViewController.h"
#import <AFNetworking.h>

@interface MyViewController () <NSXMLParserDelegate>

@end

@implementation MyViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self afnDemo];
    [self requestInfo];
    
    [self callWCF];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

////使用AFN无参
//-(void)AfnDemo
//{
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:k_initUrl] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20.0f];
//    AFHTTPRequestOperation *operation =[[AFHTTPRequestOperation alloc] initWithRequest:request];
//    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        //返回字符串
//        NSString *html = operation.responseString;
//        NSLog(@"html----%@",html);
//        //将返回字符串头去掉：<?xml version=\"1.0\" encoding=\"utf-8\"?>
//        NSString *str =@"<?xml version=\"1.0\" encoding=\"utf-8\"?>";
//        NSString *strhtml =[html stringByReplacingOccurrencesOfString:str withString:@""];
//        //将返回字符串头去掉
//        strhtml = [strhtml stringByReplacingOccurrencesOfString:@"<string xmlns=\"http://tempuri.org/\">" withString:@""];
//        //将返回的字符串尾去掉
//        strhtml = [strhtml stringByReplacingOccurrencesOfString:@"</string>" withString:@""];
//        //去掉结尾空格
//        NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
//        strhtml= [[NSString alloc]initWithString:[strhtml stringByTrimmingCharactersInSet:whiteSpace]];
//        
//        NSLog(@"无参----%@",strhtml);
//        
//        
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [self initFailure];
//    }];
//    [operation start];
//}

////使用AFN有参
//-(void)AfnDemo2:(NSString *)catObj
//{
//    
//    NSString *url = @"http://115.231.54.166:9090/JobRecordAPP.asmx/BrowseStatistics?";
//    NSString *k_initUrl3 =[url stringByAppendingFormat:@"LoginID=%@",catObj];
//    //  NSLog(@"strurl---%@",strurl);
//    //   NSLog(@"%d",self.PRKID);
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:k_initUrl3] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20.0f];
//    AFHTTPRequestOperation *operation =[[AFHTTPRequestOperation alloc] initWithRequest:request];
//    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSString *html = operation.responseString;
        //将返回字符串头去掉：<?xml version=\"1.0\" encoding=\"utf-8\"?>
//        NSString *str =@"<?xml version=\"1.0\" encoding=\"utf-8\"?>";
//        NSString *strhtml =[html stringByReplacingOccurrencesOfString:str withString:@""];
//        //将返回字符串头去掉
//        strhtml = [strhtml stringByReplacingOccurrencesOfString:@"<string xmlns=\"http://tempuri.org/\">" withString:@""];
//        //将返回的字符串尾去掉
//        strhtml = [strhtml stringByReplacingOccurrencesOfString:@"</string>" withString:@""];
//        //去掉结尾空格
//        NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
//        strhtml= [[NSString alloc]initWithString:[strhtml stringByTrimmingCharactersInSet:whiteSpace]];
//        NSLog(@"有参----%@",strhtml);
//
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [self initFailure];
//    }];
//    [operation start];
//}

- (void)afnDemo {
    
}

- (void)requestInfo {
//    NSURL *url = [NSURL URLWithString:@"http://192.268.0.11:9422/Service1.svc/LogInf/111/111"];
//                  
//                  ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//                  
//                  [request setRequestMethod:@"POST"];
//                  
//                  [request startSynchronous];
//                  
//                  NSError *error = [request error];
//                  
//                  if (!error) {
//                      
//                      NSString *response = [request responseString];
//                      
//                      UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"测试"
//                                                
//                                                                          message:response
//                                                
//                                                                         delegate:nil  
//                                                
//                                                                cancelButtonTitle:@"OK" 
//                                                
//                                                                otherButtonTitles:nil];   
//                      
//                      [alertView show];  
//                      
//                      [alertView release];  
//                      
//                  }
    
    
//    NSString *urlString = @"http://101.247.64.139:4321/MobileInterface/AppServiceManager.svc";
//    urlString = [urlString stringByAppendingString:@"/ValidateUser/loginAccount=s0/passWord=1/simCardNum=0/mobileId=0/phoneModel=0/phoneSysVersion=0/appVersion=0"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
//    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    NSLog(@"%@", data);
    
//        // 1.设置请求路径
//        NSURL *URL = [NSURL URLWithString:@"http://101.247.64.139:4321/MobileInterface/AppServiceManager.svc/ValidateUser"];//不需要传递参数
//        // 2.创建请求对象
//        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];//默认为get请求
//        request.timeoutInterval = 5.0;//设置请求超时为5秒
//        request.HTTPMethod = @"POST";//设置请求方法
//    
//        //设置请求体
//        NSString *param = [NSString stringWithFormat:@"loginAccount=s0/passWord=1/simCardNum=0/mobileId=0/phoneModel=0/phoneSysVersion=0/appVersion=0"];
//        //把拼接后的字符串转换为data，设置请求体
//        request.HTTPBody=[param dataUsingEncoding:NSUTF8StringEncoding];
//    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    NSLog(@"%@", data);
    
    
}

- (void)callWCF {
//    NSString *soapMessage = @"<v:Envelope xmlns:i=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:d=\"http://www.w3.org/2001/XMLSchema\" xmlns:c=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:v=\"http://schemas.xmlsoap.org/soap/envelope/\"><v:Header /><v:Body><ValidateUser xmlns=\"http://101.247.64.139:4321/MobileInterface/AppServiceManager.svc/\" id=\"o0\" c:root=\"1\"><loginAccount i:type=\"d:string\">s0</loginAccount><passWord type i:type=\"d:string\">1</passWord><simCardNum i:type=\"d:string\">1</simCardNum><mobileId i:type=\"d:string\">1</mobileId><phoneModel i:type=\"d:string\">1</phoneModel><phoneSysVersion i:type=\"d:string\">1</phoneSysVersion><appVersion i:type=\"d:string\">1</appVersion></ValidateUser></v:Body></v:Envelope>";
    
//    NSString *soapMessage = @"<v:Envelope xmlns:i=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:d=\"http://www.w3.org/2001/XMLSchema\" xmlns:c=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:v=\"http://schemas.xmlsoap.org/soap/envelope/\"><v:Header /><v:Body><ValidateUser xmlns=\"http://tempuri.org/\" id=\"o0\" c:root=\"1\"><loginAccount i:type=\"d:string\">s0</loginAccount><passWord type i:type=\"d:string\">1</passWord><simCardNum i:type=\"d:string\">1</simCardNum><mobileId i:type=\"d:string\">1</mobileId><phoneModel i:type=\"d:string\">1</phoneModel><phoneSysVersion i:type=\"d:string\">1</phoneSysVersion><appVersion i:type=\"d:string\">1</appVersion></ValidateUser></v:Body></v:Envelope>";
    
//    NSString *soapMessage = @"<v:Envelope xmlns:i=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:d=\"http://www.w3.org/2001/XMLSchema\" xmlns:c=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:v=\"http://schemas.xmlsoap.org/soap/envelope/\"><v:Header /><v:Body><ValidateUser xmlns=\"http://tempuri.org/\" id=\"o0\" c:root=\"1\"><loginAccount i:type=\"d:string\">s0</loginAccount><passWord type i:type=\"d:string\">1</passWord><simCardNum i:type=\"d:string\">1</simCardNum><mobileId i:type=\"d:string\">1</mobileId><phoneModel i:type=\"d:string\">1</phoneModel><phoneSysVersion i:type=\"d:string\">1</phoneSysVersion><appVersion i:type=\"d:string\">1</appVersion></ValidateUser></v:Body></v:Envelope>";
//    
//    NSString *soapMessage = @"<?xml version=\"1.0\"?><soap:Envelopexmlns:soap=\"http://www.w3.org/2001/12/soap-envelope\" soap:encodingStyle=\"http://www.w3.org/2001/12/soap-encoding\"><soap:Body xmlns:m=\"http://tempuri.org/\"><ValidateUser><loginAccount i:type=\"d:string\">s0</loginAccount><passWord type i:type=\"d:string\">1</passWord><simCardNum i:type=\"d:string\">1</simCardNum><mobileId i:type=\"d:string\">1</mobileId><phoneModel i:type=\"d:string\">1</phoneModel><phoneSysVersion i:type=\"d:string\">1</phoneSysVersion><appVersion i:type=\"d:string\">1</appVersion></ValidateUser></soap:Body></soap:Envelope>";
    
//    soap1.1
//    NSString *soapMessage =
//    [NSString stringWithFormat:
//     @"<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
//     "<soap:Body>\n"
//     "<ValidateUser xmlns=\"http://tempuri.org/\">\n"
//     "<loginAccount>你好</loginAccount>\n"
//     "<passWord>0</passWord>\n"
//     "<simCardNum>1</simCardNum>\n"
//     "<mobileId>1</mobileId>\n"
//     "<phoneModel>1</phoneModel>\n"
//     "<phoneSysVersion>1</phoneSysVersion>\n"
//     "<appVersion>1</appVersion>\n"
//     "</ValidateUser>\n"
//     "</soap:Body>\n"
//     "</soap:Envelope>\n"
//     ];
    
    NSString *soapMessage =
    [NSString stringWithFormat:
     @"<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
     "<soap:Body>\n"
     "<SubmitEmployeePunchData xmlns=\"http://tempuri.org/\">\n"
     "<sessionId>6ecaa142-3801-40e0-8fdf-e8d2d7ebf91d</sessionId>\n"
     "<major>1</major>\n"
     "<longitude>1.0</longitude>\n"
     "<latitude>1.0</latitude>\n"
     "<description></description>\n"
     "</SubmitEmployeePunchData>\n"
     "</soap:Body>\n"
     "</soap:Envelope>\n"
     ];
    
//    NSString *soapMessage =
//    [NSString stringWithFormat:
//     @"<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
//     "<soap:Body>\n"
//     "<SubmitEmployeePunchData xmlns=\"http://tempuri.org/\">\n"
//     "<sessionId>126c9e2b-d242-4a3e-9ab4-7e4984ddf4cd</sessionId>\n"
//     "<deptId>46c7b67d-cd43-452e-9647-8f48b5776622</deptId>\n"
//     "<longitude>1</longitude>\n"
//     "<latitude>1</latitude>\n"
//     "</SubmitEmployeePunchData>\n"
//     "</soap:Body>\n"
//     "</soap:Envelope>\n"
//     ];
    
    // 请求发送到的路径
    NSURL *url = [NSURL URLWithString:@"http://101.247.64.139:4321/MobileInterface/AppServiceManager.svc"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%ld", [soapMessage length]];
    [theRequest addValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue:@"http://tempuri.org/IAppService/SubmitEmployeePunchData" forHTTPHeaderField:@"SOAPAction"];
    [theRequest addValue:msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody:[soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:theRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error);
        }else {
            
            // 将返回的数据转换为字符串，进行解析（返回的是XML数据）
            NSString *theXML = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
            
            NSLog(@"%@", theXML);
            
            self.element = [NSMutableString new];
            
            NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
            parser.delegate = self;
            [parser parse];
        }
    }];
    
    [dataTask resume];
    
//    NSError *error;
//    NSData *data = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:nil error:&error];
//    if (error) {
//        NSLog(@"%@", error);
//    }else {
////        NSLog(@"data:%@", data);
//        
//        // 将返回的数据转换为字符串，进行解析（返回的是XML数据）
//        NSString *theXML = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
//        
//        NSLog(@"%@", theXML);
//
//    }
    
//    //soap1.2
//    NSString *soapMessage =
//    [NSString stringWithFormat:
//     @"<soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope/\">\n"
//     "<soap12:Body>\n"
//     "<ValidateUser xmlns=\"http://tempuri.org/\">\n"
//     "<loginAccount>s1</loginAccount>\n"
//     "<passWord>0</passWord>\n"
//     "<simCardNum>1</simCardNum>\n"
//     "<mobileId>1</mobileId>\n"
//     "<phoneModel>1</phoneModel>\n"
//     "<phoneSysVersion>1</phoneSysVersion>\n"
//     "<appVersion>1</appVersion>\n"
//     "</ValidateUser>\n"
//     "</soap12:Body>\n"
//     "</soap12:Envelope>\n"
//     ];
//    
//    NSURL *url = [NSURL URLWithString:@"http://101.247.64.139:4321/MobileInterface/AppServiceManager.svc"]; // 请求发送到的路径
//    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
//    NSString *msgLength = [NSString stringWithFormat:@"%ld", [soapMessage length]];
//    [theRequest addValue:@"application/soap+xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
////    [theRequest addValue:@"http://tempuri.org/IAppService/ValidateUser" forHTTPHeaderField:@"SOAPAction"];
//    [theRequest addValue:msgLength forHTTPHeaderField:@"Content-Length"];
//    [theRequest setHTTPMethod:@"POST"];
//    [theRequest setHTTPBody:[soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
//    NSError *error;
//    NSData *data = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:nil error:&error];
//    if (error) {
//        NSLog(@"%@", error);
//    }else {
//        //        NSLog(@"data:%@", data);
//        NSString *theXML = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding]; // 将返回的数据转换为字符串，进行解析（返回的是XML数据）
//        NSLog(@"%@", theXML);
//        
//    }
    
}

#pragma mark - NSXMLParserDelegate

//- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
//    
//    NSLog(@"%@, %@, %@, %@", elementName, namespaceURI, qName, attributeDict);
//    
//    if ([elementName isEqualToString:@"ValidateUserResult"]) {
//        NSLog(@"%@", attributeDict);
//    }
//}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
//    NSLog(@"String:%@", string);

    [self.element appendString:string];
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSString *string = self.element;

    if ([elementName isEqualToString:@"SubmitEmployeePunchDataResult"]) {
        NSLog(@"返回的结果：%@", string);
    }
    
    
}

@end













