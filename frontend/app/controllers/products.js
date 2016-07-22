import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    destroyProduct(prod) {
      if (confirm('Are you sure?')) {
        prod.destroyRecord();
      }
    },

    updatingProduct(prod) {
      this.set('updatingProduct', prod);
      this.set('showUpdateModal', true);
    },

    cancelUpdate() {
      this.get('updatingProduct').rollbackAttributes();
      this.set('showUpdateModal', false);
    },

    saveUpdatingProduct() {
      if (!this.get('updatingProduct.isValid')) {
        return false;
      }

      this.get('updatingProduct').save();
      this.set('showUpdateModal', false);
    },

    startCreateProduct() {
      this.set('creatingProduct', this.get('model.store').createRecord('product'));
      this.set('showCreateModal', true);
    },

    cancelCreate() {
      this.get('creatingProduct').deleteRecord();
      this.set('showCreateModal', false);
    },

    saveCreatingProduct() {
      this.get('creatingProduct').save();
      this.set('showCreateModal', false);
    }
  }
});
