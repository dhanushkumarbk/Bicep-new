param actionRuleName string = 'apr-AMBA-BHF-CIR-PROD-S002'  
param targetSubscriptionId string = '45f9088d-45c9-4665-8240-05657a7012b9'  
param targetResourceGroupName string = 'UKS-PROD-RSG-CIR02'  
param targetResourceType string = 'microsoft.compute/virtualmachines'  
param enabled bool = true
param description string = 'AMBA Notification Assets - Suppression Alert Processing Rule for maintenance period'

resource actionRule 'Microsoft.AlertsManagement/actionRules@2021-08-08' = {
  name: actionRuleName
  location: 'Global'
  tags: {
    _deployed_by_amba: 'true'
  }
  properties: {
    scopes: [
      '/subscriptions/${targetSubscriptionId}'
    ]
    conditions: [
      {
        field: 'TargetResourceGroup'
        operator: 'Equals'
        values: [
          '/subscriptions/${targetSubscriptionId}/resourceGroups/${targetResourceGroupName}'
        ]
      }
      {
        field: 'TargetResourceType'
        operator: 'Equals'
        values: [
          targetResourceType
        ]
      }
    ]
    enabled: enabled
    actions: [
      {
        actionType: 'RemoveAllActionGroups'
      }
    ]
    description: description
  }
}