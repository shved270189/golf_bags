import Ember from 'ember';

export function increment(params/*, hash*/) {
  return parseInt(params[0]) + 1;
}

export default Ember.Helper.helper(increment);
