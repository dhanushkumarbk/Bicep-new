using './Alert-processing-rule.bicep'

param actionRuleName = 'apr-AMBA-BHF-CIR-UAT-S002'
param targetResourceGroupName = 'UKS-UAT-RSG-CIR02'
param targetResourceType = 'Microsoft.Compute/virtualMachines'
param enabled = true
param actionRuleDescription = 'AMBA Notification Assets - Suppression Alert Processing Rule'
