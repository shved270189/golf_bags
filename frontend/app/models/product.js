import Model from 'ember-data/model';
import attr from 'ember-data/attr';
// import { belongsTo, hasMany } from 'ember-data/relationships';

export default Model.extend({
  name: attr('string'),
  type: attr('string'),
  length: attr('number'),
  width: attr('number'),
  height: attr('number'),
  weight: attr('number')
});
