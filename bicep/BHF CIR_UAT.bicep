param actionRuleName string = 'apr-AMBA-BHF-CIR-UAT-S002'  
param targetSubscriptionId string = '711c9e0c-ccf8-4299-8310-68ef0c4c9985'  
param targetResourceGroupName string = 'UKS-UAT-RSG-CIR02'  
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