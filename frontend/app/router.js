import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('calculator');
  this.route('products', { path: '/' });
});

export default Router;
