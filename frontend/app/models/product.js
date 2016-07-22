import Model from 'ember-data/model';
import attr from 'ember-data/attr';
// import { belongsTo, hasMany } from 'ember-data/relationships';
import EmberValidations from 'ember-validations';

export default Model.extend(EmberValidations, {
  name: attr('string'),
  type: attr('string'),
  length: attr('number'),
  width: attr('number'),
  height: attr('number'),
  weight: attr('number'),

  validations: {
    name: {
      presence: true
    },
    type: {
      presence: true
    },
    length: {
      presence: true,
      numericality: {
        onlyInteger: true,
        greaterThan: 0
      }
    },
    width: {
      presence: true,
      numericality: {
        onlyInteger: true,
        greaterThan: 0
      }
    },
    height: {
      presence: true,
      numericality: {
        onlyInteger: true,
        greaterThan: 0
      }
    },
    weight: {
      presence: true,
      numericality: {
        onlyInteger: true,
        greaterThan: 0
      }
    }
  }
});
