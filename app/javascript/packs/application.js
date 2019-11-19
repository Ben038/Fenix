import "bootstrap";
import "../components/chartfunctions";
import "../components/sidebar";
import "../components/navbar";
import Sortable from 'sortablejs';

Sortable.create(sortableKpi, {
  handle: '.card-kpi',
  animation: 150
});

Sortable.create(sortableCharts, {
  handle: '.card-chart',
  animation: 150
});
