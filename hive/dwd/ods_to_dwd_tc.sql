SELECT
    ods_tc_openbilling.houseId,
    ods_tc_openbilling.platform,
    ods_tc_openbilling.billingState,
    ods_tc_openbilling_paymentmethod.paymentMethodId,
    ods_tc_openbilling_paymentmethod.paymentMethodName,
    ods_tc_openbilling.startDate,
    ods_tc_openbilling.endDate,
    ods_tc_openbilling.price,
    ods_tc_openbilling.number,
    ods_tc_openbilling.yearMonth,
    ods_tc_openbilling.subjectsName,
    tcm.cardTypeName,
    ods_tc_openbilling.propertyId,
    ods_tc_openbilling.parkingId,
    ods_tc_openbilling.customerId,
    ods_tc_openbilling.customerName,
    ods_tc_openbilling.amountReceivable,
    ods_tc_openbilling.amountReal,
    ods_tc_openbilling.yardId,
    ods_tc_openbilling.skdNo,
    ods_tc_openbilling.userName,
    ods_tc_openbilling.collectionTime,
    ods_tc_openbilling.carNo,
    ods_tc_openbilling.updateTime,
    tcm.handleMobile,
    tcm.carNo
from ods_tc_openbilling
         LEFT JOIN (SELECT
                        ods_tc_monthcard.id,
                        ods_tc_monthcard.cardTypeName,
                        ods_tc_monthcard.handleMobile,
                        ods_tc_monthcard_car.carNo
                    FROM
                        ods_tc_monthcard
                            LEFT JOIN ods_tc_monthcard_car on ods_tc_monthcard.id=ods_tc_monthcard_car.monthCardId) AS tcm on tcm.id=ods_tc_openbilling.monthCardId
         LEFT JOIN ods_tc_openbilling_paymentmethod on ods_tc_openbilling_paymentmethod.openbillingId=ods_tc_openbilling.id;