//
//  EC3EnvironmentSpec.m
//  CieloEcommerce
//
//  Created by Thiago Rodrigues de Paula on 28/09/16.
//  Copyright © 2016 Thiago Rodrigues de Paula. All rights reserved.
//

#import <CieloEcommerce/EC3Environment.h>

SpecBegin(EC3EnvironmentSpec)

describe(@"+sandbox", ^{
    it(@"should contain the correct urls", ^{
        EC3Environment *sandbox = [EC3Environment sandbox];
        
        expect(sandbox.apiUrl).to.equal(@"https://apisandbox.cieloecommerce.cielo.com.br/");
        expect(sandbox.apiQueryUrl).to.equal(@"https://apiquerysandbox.cieloecommerce.cielo.com.br/");
    });
});

describe(@"+production", ^{
    it(@"should contain the correct urls", ^{
        EC3Environment *production = [EC3Environment production];
        
        expect(production.apiUrl).to.equal(@"https://api.cieloecommerce.cielo.com.br/");
        expect(production.apiQueryUrl).to.equal(@"https://apiquery.cieloecommerce.cielo.com.br/");
    });
});

SpecEnd
