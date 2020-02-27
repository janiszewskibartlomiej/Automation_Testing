describe('Sign in with different methods', function () {
    beforeEach('navigate to home page', function () {
        cy.visit('/rejestracja');
        cy.url().should('include', '/rejestracja');
        //cy.get('.se-pre-con:hidden').as('loader');
    })
    it('Register happy path', function () {
        let timeNow = Date.now();
        cy.get('[for=parentGenderM]')
            .click();
        cy.get('#autocomplete-name')
            .type('Bart');
        cy.get(':nth-child(7) > .form-control')
            .type('Jani');
        cy.get(':nth-child(8) > .form-control')
            .type('cypress' + timeNow + '@automation.com')
            .should('have.value', ('cypress' + timeNow + '@automation.com'));
        cy.get(':nth-child(9) > .form-control')
            .type('cypress' + timeNow + '@automation.com')
            .should('have.value', ('cypress' + timeNow + '@automation.com'));
        cy.get(':nth-child(10) > .form-control')
            .type('AdamKowalski123!')
            .should('have.value', 'AdamKowalski123!');
        cy.get(':nth-child(11) > .form-control')
            .type('AdamKowalski123!')
            .should('have.value', 'AdamKowalski123!');
        cy.get('[for=bornChild]')
            .click();
        cy.get('[for=childNotBornGenderM]')
            .click();
        cy.get('select.day.form-control.childBornDateSelect')
            .select('12');
        cy.get('select.month.form-control.childBornDateSelect')
            .select('11');
        cy.get('select.year.form-control.childBornDateSelect')
            .select('2019');
        cy.get('input.form-control.childName')
            .type('bart');
        cy.get('[for=hippTest]')
            .click();
        cy.get('#autocomplete-city')
            .type('Gdansk');
        cy.get('#autocomplete-street')
            .type('Komandosów');
        cy.get('#autocomplete-zip')
            .type('12');
        cy.get('#complete-zip')
            .type('80-000');
        cy.get('[placeholder="Numer telefonu"]')
            .type('156852645')
        cy.get('[for=newsletter]')
            .click();
        //cy.get('@loader');
        cy.get('label[for=checkboxToc2]')
            .should('be.visible');
        cy.get('label[for=checkboxToc2]')
            .click();
        cy.contains('Zarejestruj się!')
            .click();
        cy.url().should('include', '/rejestracja/walidacja');
        cy.contains('Twoje zgłoszenie przebiegło pomyślnie.Sprawdź skrzynkę mailową!');
        
    })
})
