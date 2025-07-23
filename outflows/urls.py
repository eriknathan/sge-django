from django.urls import path
from . import views


urlpatterns = [
    path('outflow/lists/', views.OutflowListView.as_view(),
         name='outflow_list'),
    path('outflow/create/', views.OutflowCreateView.as_view(),
         name='outflow_create'),
    path('outflow/<int:pk>/detail/', views.OutflowDetailView.as_view(),
         name='outflow_detail'),

    path('api/v1/outflows/', views.OutflowCreateListAPIView.as_view(),
         name='outflow-create-list-api-view'),
    path('api/v1/outflows/<int:pk>/', views.OutflowRetriveAPIView.as_view(),
         name='outflow-detail-api-view'),
]
