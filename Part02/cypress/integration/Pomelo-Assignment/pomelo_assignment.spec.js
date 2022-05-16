///  <reference types ="Cypress" />

context('Please go to https://www.pomelofashion.com/th/en/ and focus automate testing on "My Shopping Bag" page.', () => {
    it('Test เข้าสู่หน้าเว็ป Pomelo', () => {
        cy.visit('https://www.pomelofashion.com/th/en/')
        cy.wait(1000)
        cy.get('img[src="https://pomelo-web-s3.pomelofashion.com/www/6.172.0/static/img/icons/system/pml-logo-prod.svg"]')
          .should('be.visible')
    })
})

context('A customer adds the products any cetegory and click "Cart" Icon.', () => {
    beforeEach(() => {
        cy.visit('https://www.pomelofashion.com/th/en/')
        cy.wait(1000)
    })
    it('Test เพิ่มของไปใน My Shopping Bag', () => {
        cy.addDressBlue()
    })
    it('Test เข้าไปใน My Shopping Bag', () => {
        cy.get('[data-cy="nav_user__cart"]')
          .click()
        cy.contains('My Shopping Bag')
          .should('be.visible')
        cy.wait(500)
    })
    it('Reset ของใน Bag', () => {
        cy.deleteitemFromBag()
    })
})

context('A customer be able to adjusts quantity of product items or items.', () => {
    beforeEach(() => {
        cy.visit('https://www.pomelofashion.com/th/en/')
        cy.wait(1000)
    })
    it('Prepare Test', () => {
        cy.addDressBlue()
    })
    it('Test เปลี่ยนจำนวนสินค้าใน Bag', () => {
        cy.get('[data-cy="nav_user__cart"]')
          .click()
        cy.get('.pml-dropdown__select')
          .eq(1)
          .select('3')
        cy.wait(1000)
    })
    it('Reset ของใน Bag', () => {
        cy.deleteitemFromBag()
    })
})

context('A customer be able to adjusts size of product items or items.', () => {
    beforeEach(() => {
        cy.visit('https://www.pomelofashion.com/th/en/')
        cy.wait(1000)
    })
    it('Prepare Test', () => {
        cy.addDressBlue()
    })
    it('Test เปลี่ยนขนาดสินค้าใน Bag', () => {
        cy.get('[data-cy="nav_user__cart"]')
          .click()
        cy.get('.pml-dropdown__select')
          .eq(0)
          .select('XS')
        cy.wait(500)
    })
    it('Reset ของใน Bag', () => {
        cy.deleteitemFromBag()
    })
})

context('A customer be able to adjust and delete product items or items.', () => {
    beforeEach(() => {
        cy.visit('https://www.pomelofashion.com/th/en/')
        cy.wait(1000)
    })
    it('Prepare Test', () => {
        cy.addDressBlue()
    })
    it('Test ลบสินค้าใน Bag', () => {
        cy.deleteitemFromBag()
    })
})

context('A customer be able to fill-in and click apply promo code. (even if promocode is not eligible.)', () => {
    beforeEach(() => {
        cy.visit('https://www.pomelofashion.com/th/en/')
        cy.wait(1000)
    })
    it('Prepare Test', () => {
        cy.addDressBlue()
    })
    it('Test ใส่ code สองแบบ (Super Promo Code: Code มั่ว, GET30TH: Code จากหน้าเว็ป)', () => {
        cy.get('[data-cy="nav_user__cart"]')
          .click()
        cy.get('input[placeholder="Enter Promo Code"]')
          .type('Super Promo Code')
        cy.get('.cart-discount__main > .jsx-3342260016')
          .click()
        cy.contains('Invalid voucher code')
          .should('be.visible')
        cy.wait(500)
        
        cy.get('input[placeholder="Enter Promo Code"]')
          .type('GET30TH')
        cy.get('.cart-discount__main > .jsx-3342260016')
          .click()
        cy.contains('Please log in')
          .should('be.visible')
    })
    it('Reset ของใน Bag', () => {
        cy.deleteitemFromBag()
    })
})

context('A customer be able to validate proceed to checkout button.)', () => {
    beforeEach(() => {
        cy.visit('https://www.pomelofashion.com/th/en/')
        cy.wait(1000)
    })
    it('Prepare Test', () => {
        cy.addDressBlue()
    })
    it('Test การ Checkout (Login ก่อน))', () => {
        cy.get('[data-cy="nav_login"] > .body2')
          .click()
        cy.typeloginAndlogin()
        
        cy.get('[data-cy="nav_user__cart"]')
          .click()
        cy.get('[data-cy="cart__checkout"]')
          .click()

        cy.contains('Shipping')
          .should('be.visible')
        cy.contains('Payment')
          .should('be.visible')
        cy.contains('Confirm')
          .should('be.visible')
    })
    it('Reset ของใน Bag (Login ก่อน)', () => {
        cy.get('[data-cy="nav_login"] > .body2')
          .click()
        cy.typeloginAndlogin()

        cy.deleteitemFromBag()
    })
})