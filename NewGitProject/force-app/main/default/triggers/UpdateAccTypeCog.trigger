trigger UpdateAccTypeCog on Opportunity (after update) {
     UpdateAccTypeCogHandler.updateAccType(Trigger.new, trigger.oldMap);
}