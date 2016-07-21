import Ember from 'ember';

export default Ember.Controller.extend({
  showCalculator: false,
  isCalculatorValid: Ember.computed('productLength', 'productWidth', 'productHeight', 'productWeight', function() {
    return !(Ember.isPresent(this.get('productLength')) &&
            Ember.isPresent(this.get('productWidth')) &&
            Ember.isPresent(this.get('productHeight')) &&
            Ember.isPresent(this.get('productWeight')));
  }),

  succsessCalculate() {
    this.set('productName', this.get('productCalcName'));
    this.resetCalcData();
    this.set('showCalculator', false);
  },

  resetCalcData() {
    this.set('productCalcName', null);
    this.set('productLength', null);
    this.set('productWidth', null);
    this.set('productHeight', null);
    this.set('productWeight', null);
  },

  actions: {
    toggleShowCalculator() {
      this.set('showCalculator', !this.get('showCalculator'));
    },

    matchProduct() {
      Ember.$.get('/api/products/match', {
        length: this.get('productLength'),
        width: this.get('productWidth'),
        height: this.get('productHeight'),
        weight: this.get('productWeight')
      }, (data) => {
        this.set('productCalcName', data.product.name);
        Ember.run.debounce(this, 'succsessCalculate', 5000);
      });
    }
  }
});
