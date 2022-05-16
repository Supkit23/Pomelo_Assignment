const email_kit = 'suppakrit@outlook.com'
const password_kit = 'supkitpomelo230742'

Cypress.Commands.add('addDressBlue', () => {
    cy.get('[data-cy="nav_user__search"]')
      .click()
    cy.get('.pml-input__wrapper > .body2')
      .type('Sustainable Puffed Sleeve Denim Dress - Blue {enter}')
    cy.get('.product_description__wrapper')
      .contains('Sustainable Puffed Sleeve Denim Dress - Blue')
      .click()
    cy.get('.pdp__options-container > .jsx-1263082677 > :nth-child(3)')
      .contains('M')
      .click()
    cy.get('.pml-btn-pri')
      .contains('Add To Bag')
      .click()
    cy.wait(3000)
})

Cypress.Commands.add('typeloginAndlogin', () => {
    cy.get('input[name="email"]')
      .type(email_kit) 
    cy.get('input[name="password"]')
      .type(password_kit)
    cy.get('[data-cy="auth__login__email__button"]')
      .click()
    cy.wait(5000)
})

Cypress.Commands.add('deleteitemFromBag', () => {
    cy.get('[data-cy="nav_user__cart"]')
        .click()
    cy.get('img[alt="cart-remove"]')
      .click()
    cy.get('.empty-cart')
      .should('be.visible')
    cy.wait(500)
})
