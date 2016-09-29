//
//  EC3ViewController.m
//  CieloEcommerce
//
//  Created by Thiago Rodrigues de Paula on 09/14/2016.
//  Copyright (c) 2016 Thiago Rodrigues de Paula. All rights reserved.
//

#import "EC3ViewController.h"
#import <CieloEcommerce/EC3Merchant.h>
#import <CieloEcommerce/EC3Sale.h>
#import <CieloEcommerce/EC3Address.h>
#import <CieloEcommerce/EC3Customer.h>
#import <CieloEcommerce/EC3CreditCard.h>
#import <CieloEcommerce/EC3Payment.h>
#import <CieloEcommerce/EC3AbstractSaleRequest.h>

@interface EC3ViewController ()

@property EC3AbstractSaleRequest *saleRequest;

@end

@implementation EC3ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    EC3Merchant *merchant = [EC3Merchant initWithId:@"3e0265a9-29df-4196-b01e-a03cd6a7e8ad" andKey:@"UYZCUHFOBDSWMYCZJUFPTDISFHAZRQTFYMKVCAYM"];
    
    self.saleRequest = [[EC3AbstractSaleRequest alloc] initWithMerchant:merchant andEnvironment:[EC3Environment sandbox]];
    
    EC3Address *address = [[EC3Address alloc] init];
    address.street = @"Rua Paulo Orozimbo";
    address.number = @"715";
    address.complement = @"Ap 108";
    address.zipCode = @"01535001";
    address.city = @"São Paulo";
    address.state = @"SP";
    address.country = @"Brazil";
    
    EC3Customer *customer = [[EC3Customer alloc] init];
    customer.name = @"Comprador Teste";
    customer.address = address;
    customer.deliveryAddress = address;
    
    EC3CreditCard *creditCard = [[EC3CreditCard alloc] init];
    creditCard.cardNumber = @"0000000000000001";
    creditCard.holder = @"Teste Holder";
    creditCard.expirationDate = @"12/2021";
    creditCard.securityCode = @"123";
    creditCard.brand = @"Visa";
    
    EC3Payment *payment = [[EC3Payment alloc] init];
    payment.amount = @15700;
    payment.type = CreditCard;
    payment.provider = Simulado;
    payment.installments = @1;
    payment.creditCard = creditCard;
    //payment.capture = YES;
    
    EC3Sale *sale = [[EC3Sale alloc] init];
    sale.merchantOrderId = @"2014111703";
    sale.customer = customer;
    sale.payment = payment;
    
    __weak EC3ViewController *weakSelf = self;
    
    [self.saleRequest createSale:sale success:^(EC3Sale *sale) {
        [weakSelf printSale:sale];
        [weakSelf captureSale:sale.payment.paymentId withAmount:15700 andServiceTaxAmount:100];
    } failure:^(NSError *error, NSHTTPURLResponse *httpResponse) {
        NSLog(@"%@", error);
    }];
}

- (void)captureSale:(NSString *)paymentId withAmount:(int)amount andServiceTaxAmount:(int)serviceTaxAmount {
    __weak EC3ViewController *weakSelf = self;
    
    [self.saleRequest captureSale:paymentId success:^(EC3Sale *sale) {
        [weakSelf findSale:paymentId];
    } failure:^(NSError *error, NSHTTPURLResponse *httpResponse) {
        NSLog(@"%@", error);
    }];
}

- (void)cancelSale:(NSString *)paymentId withAmount:(int)amount {
    __weak EC3ViewController *weakSelf = self;
    
    [self.saleRequest cancelSale:paymentId withAmount:amount success:^(EC3Sale *sale) {
        [weakSelf findSale:paymentId];
    } failure:^(NSError *error, NSHTTPURLResponse *httpResponse) {
        NSLog(@"%@", error);
    }];
}

- (void)findSale:(NSString *)paymentId {
    __weak EC3ViewController *weakSelf = self;
    
    [self.saleRequest querySale:paymentId success:^(EC3Sale *sale) {
        [weakSelf printSale:sale];
    } failure:^(NSError *error, NSHTTPURLResponse *httpResponse) {
        NSLog(@"%@", error);
    }];
}

- (void)printSale:(EC3Sale *)sale {
    NSLog(@"\n\n\n\n\n\n\n\n\n\n%@\n\n\n\n\n\n\n\n\n\n", sale);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
