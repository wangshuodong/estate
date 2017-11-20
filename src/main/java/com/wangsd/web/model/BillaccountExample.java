package com.wangsd.web.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BillaccountExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public BillaccountExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andHousingIdIsNull() {
            addCriterion("housing_id is null");
            return (Criteria) this;
        }

        public Criteria andHousingIdIsNotNull() {
            addCriterion("housing_id is not null");
            return (Criteria) this;
        }

        public Criteria andHousingIdEqualTo(Integer value) {
            addCriterion("housing_id =", value, "housingId");
            return (Criteria) this;
        }

        public Criteria andHousingIdNotEqualTo(Integer value) {
            addCriterion("housing_id <>", value, "housingId");
            return (Criteria) this;
        }

        public Criteria andHousingIdGreaterThan(Integer value) {
            addCriterion("housing_id >", value, "housingId");
            return (Criteria) this;
        }

        public Criteria andHousingIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("housing_id >=", value, "housingId");
            return (Criteria) this;
        }

        public Criteria andHousingIdLessThan(Integer value) {
            addCriterion("housing_id <", value, "housingId");
            return (Criteria) this;
        }

        public Criteria andHousingIdLessThanOrEqualTo(Integer value) {
            addCriterion("housing_id <=", value, "housingId");
            return (Criteria) this;
        }

        public Criteria andHousingIdIn(List<Integer> values) {
            addCriterion("housing_id in", values, "housingId");
            return (Criteria) this;
        }

        public Criteria andHousingIdNotIn(List<Integer> values) {
            addCriterion("housing_id not in", values, "housingId");
            return (Criteria) this;
        }

        public Criteria andHousingIdBetween(Integer value1, Integer value2) {
            addCriterion("housing_id between", value1, value2, "housingId");
            return (Criteria) this;
        }

        public Criteria andHousingIdNotBetween(Integer value1, Integer value2) {
            addCriterion("housing_id not between", value1, value2, "housingId");
            return (Criteria) this;
        }

        public Criteria andRoominfoIdIsNull() {
            addCriterion("roominfo_id is null");
            return (Criteria) this;
        }

        public Criteria andRoominfoIdIsNotNull() {
            addCriterion("roominfo_id is not null");
            return (Criteria) this;
        }

        public Criteria andRoominfoIdEqualTo(Integer value) {
            addCriterion("roominfo_id =", value, "roominfoId");
            return (Criteria) this;
        }

        public Criteria andRoominfoIdNotEqualTo(Integer value) {
            addCriterion("roominfo_id <>", value, "roominfoId");
            return (Criteria) this;
        }

        public Criteria andRoominfoIdGreaterThan(Integer value) {
            addCriterion("roominfo_id >", value, "roominfoId");
            return (Criteria) this;
        }

        public Criteria andRoominfoIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("roominfo_id >=", value, "roominfoId");
            return (Criteria) this;
        }

        public Criteria andRoominfoIdLessThan(Integer value) {
            addCriterion("roominfo_id <", value, "roominfoId");
            return (Criteria) this;
        }

        public Criteria andRoominfoIdLessThanOrEqualTo(Integer value) {
            addCriterion("roominfo_id <=", value, "roominfoId");
            return (Criteria) this;
        }

        public Criteria andRoominfoIdIn(List<Integer> values) {
            addCriterion("roominfo_id in", values, "roominfoId");
            return (Criteria) this;
        }

        public Criteria andRoominfoIdNotIn(List<Integer> values) {
            addCriterion("roominfo_id not in", values, "roominfoId");
            return (Criteria) this;
        }

        public Criteria andRoominfoIdBetween(Integer value1, Integer value2) {
            addCriterion("roominfo_id between", value1, value2, "roominfoId");
            return (Criteria) this;
        }

        public Criteria andRoominfoIdNotBetween(Integer value1, Integer value2) {
            addCriterion("roominfo_id not between", value1, value2, "roominfoId");
            return (Criteria) this;
        }

        public Criteria andCostTypeIsNull() {
            addCriterion("cost_type is null");
            return (Criteria) this;
        }

        public Criteria andCostTypeIsNotNull() {
            addCriterion("cost_type is not null");
            return (Criteria) this;
        }

        public Criteria andCostTypeEqualTo(String value) {
            addCriterion("cost_type =", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeNotEqualTo(String value) {
            addCriterion("cost_type <>", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeGreaterThan(String value) {
            addCriterion("cost_type >", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeGreaterThanOrEqualTo(String value) {
            addCriterion("cost_type >=", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeLessThan(String value) {
            addCriterion("cost_type <", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeLessThanOrEqualTo(String value) {
            addCriterion("cost_type <=", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeLike(String value) {
            addCriterion("cost_type like", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeNotLike(String value) {
            addCriterion("cost_type not like", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeIn(List<String> values) {
            addCriterion("cost_type in", values, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeNotIn(List<String> values) {
            addCriterion("cost_type not in", values, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeBetween(String value1, String value2) {
            addCriterion("cost_type between", value1, value2, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeNotBetween(String value1, String value2) {
            addCriterion("cost_type not between", value1, value2, "costType");
            return (Criteria) this;
        }

        public Criteria andBillEntryAmountIsNull() {
            addCriterion("bill_entry_amount is null");
            return (Criteria) this;
        }

        public Criteria andBillEntryAmountIsNotNull() {
            addCriterion("bill_entry_amount is not null");
            return (Criteria) this;
        }

        public Criteria andBillEntryAmountEqualTo(Double value) {
            addCriterion("bill_entry_amount =", value, "billEntryAmount");
            return (Criteria) this;
        }

        public Criteria andBillEntryAmountNotEqualTo(Double value) {
            addCriterion("bill_entry_amount <>", value, "billEntryAmount");
            return (Criteria) this;
        }

        public Criteria andBillEntryAmountGreaterThan(Double value) {
            addCriterion("bill_entry_amount >", value, "billEntryAmount");
            return (Criteria) this;
        }

        public Criteria andBillEntryAmountGreaterThanOrEqualTo(Double value) {
            addCriterion("bill_entry_amount >=", value, "billEntryAmount");
            return (Criteria) this;
        }

        public Criteria andBillEntryAmountLessThan(Double value) {
            addCriterion("bill_entry_amount <", value, "billEntryAmount");
            return (Criteria) this;
        }

        public Criteria andBillEntryAmountLessThanOrEqualTo(Double value) {
            addCriterion("bill_entry_amount <=", value, "billEntryAmount");
            return (Criteria) this;
        }

        public Criteria andBillEntryAmountIn(List<Double> values) {
            addCriterion("bill_entry_amount in", values, "billEntryAmount");
            return (Criteria) this;
        }

        public Criteria andBillEntryAmountNotIn(List<Double> values) {
            addCriterion("bill_entry_amount not in", values, "billEntryAmount");
            return (Criteria) this;
        }

        public Criteria andBillEntryAmountBetween(Double value1, Double value2) {
            addCriterion("bill_entry_amount between", value1, value2, "billEntryAmount");
            return (Criteria) this;
        }

        public Criteria andBillEntryAmountNotBetween(Double value1, Double value2) {
            addCriterion("bill_entry_amount not between", value1, value2, "billEntryAmount");
            return (Criteria) this;
        }

        public Criteria andAcctPeriodIsNull() {
            addCriterion("acct_period is null");
            return (Criteria) this;
        }

        public Criteria andAcctPeriodIsNotNull() {
            addCriterion("acct_period is not null");
            return (Criteria) this;
        }

        public Criteria andAcctPeriodEqualTo(String value) {
            addCriterion("acct_period =", value, "acctPeriod");
            return (Criteria) this;
        }

        public Criteria andAcctPeriodNotEqualTo(String value) {
            addCriterion("acct_period <>", value, "acctPeriod");
            return (Criteria) this;
        }

        public Criteria andAcctPeriodGreaterThan(String value) {
            addCriterion("acct_period >", value, "acctPeriod");
            return (Criteria) this;
        }

        public Criteria andAcctPeriodGreaterThanOrEqualTo(String value) {
            addCriterion("acct_period >=", value, "acctPeriod");
            return (Criteria) this;
        }

        public Criteria andAcctPeriodLessThan(String value) {
            addCriterion("acct_period <", value, "acctPeriod");
            return (Criteria) this;
        }

        public Criteria andAcctPeriodLessThanOrEqualTo(String value) {
            addCriterion("acct_period <=", value, "acctPeriod");
            return (Criteria) this;
        }

        public Criteria andAcctPeriodLike(String value) {
            addCriterion("acct_period like", value, "acctPeriod");
            return (Criteria) this;
        }

        public Criteria andAcctPeriodNotLike(String value) {
            addCriterion("acct_period not like", value, "acctPeriod");
            return (Criteria) this;
        }

        public Criteria andAcctPeriodIn(List<String> values) {
            addCriterion("acct_period in", values, "acctPeriod");
            return (Criteria) this;
        }

        public Criteria andAcctPeriodNotIn(List<String> values) {
            addCriterion("acct_period not in", values, "acctPeriod");
            return (Criteria) this;
        }

        public Criteria andAcctPeriodBetween(String value1, String value2) {
            addCriterion("acct_period between", value1, value2, "acctPeriod");
            return (Criteria) this;
        }

        public Criteria andAcctPeriodNotBetween(String value1, String value2) {
            addCriterion("acct_period not between", value1, value2, "acctPeriod");
            return (Criteria) this;
        }

        public Criteria andReleaseDayIsNull() {
            addCriterion("release_day is null");
            return (Criteria) this;
        }

        public Criteria andReleaseDayIsNotNull() {
            addCriterion("release_day is not null");
            return (Criteria) this;
        }

        public Criteria andReleaseDayEqualTo(String value) {
            addCriterion("release_day =", value, "releaseDay");
            return (Criteria) this;
        }

        public Criteria andReleaseDayNotEqualTo(String value) {
            addCriterion("release_day <>", value, "releaseDay");
            return (Criteria) this;
        }

        public Criteria andReleaseDayGreaterThan(String value) {
            addCriterion("release_day >", value, "releaseDay");
            return (Criteria) this;
        }

        public Criteria andReleaseDayGreaterThanOrEqualTo(String value) {
            addCriterion("release_day >=", value, "releaseDay");
            return (Criteria) this;
        }

        public Criteria andReleaseDayLessThan(String value) {
            addCriterion("release_day <", value, "releaseDay");
            return (Criteria) this;
        }

        public Criteria andReleaseDayLessThanOrEqualTo(String value) {
            addCriterion("release_day <=", value, "releaseDay");
            return (Criteria) this;
        }

        public Criteria andReleaseDayLike(String value) {
            addCriterion("release_day like", value, "releaseDay");
            return (Criteria) this;
        }

        public Criteria andReleaseDayNotLike(String value) {
            addCriterion("release_day not like", value, "releaseDay");
            return (Criteria) this;
        }

        public Criteria andReleaseDayIn(List<String> values) {
            addCriterion("release_day in", values, "releaseDay");
            return (Criteria) this;
        }

        public Criteria andReleaseDayNotIn(List<String> values) {
            addCriterion("release_day not in", values, "releaseDay");
            return (Criteria) this;
        }

        public Criteria andReleaseDayBetween(String value1, String value2) {
            addCriterion("release_day between", value1, value2, "releaseDay");
            return (Criteria) this;
        }

        public Criteria andReleaseDayNotBetween(String value1, String value2) {
            addCriterion("release_day not between", value1, value2, "releaseDay");
            return (Criteria) this;
        }

        public Criteria andDeadlineIsNull() {
            addCriterion("deadline is null");
            return (Criteria) this;
        }

        public Criteria andDeadlineIsNotNull() {
            addCriterion("deadline is not null");
            return (Criteria) this;
        }

        public Criteria andDeadlineEqualTo(String value) {
            addCriterion("deadline =", value, "deadline");
            return (Criteria) this;
        }

        public Criteria andDeadlineNotEqualTo(String value) {
            addCriterion("deadline <>", value, "deadline");
            return (Criteria) this;
        }

        public Criteria andDeadlineGreaterThan(String value) {
            addCriterion("deadline >", value, "deadline");
            return (Criteria) this;
        }

        public Criteria andDeadlineGreaterThanOrEqualTo(String value) {
            addCriterion("deadline >=", value, "deadline");
            return (Criteria) this;
        }

        public Criteria andDeadlineLessThan(String value) {
            addCriterion("deadline <", value, "deadline");
            return (Criteria) this;
        }

        public Criteria andDeadlineLessThanOrEqualTo(String value) {
            addCriterion("deadline <=", value, "deadline");
            return (Criteria) this;
        }

        public Criteria andDeadlineLike(String value) {
            addCriterion("deadline like", value, "deadline");
            return (Criteria) this;
        }

        public Criteria andDeadlineNotLike(String value) {
            addCriterion("deadline not like", value, "deadline");
            return (Criteria) this;
        }

        public Criteria andDeadlineIn(List<String> values) {
            addCriterion("deadline in", values, "deadline");
            return (Criteria) this;
        }

        public Criteria andDeadlineNotIn(List<String> values) {
            addCriterion("deadline not in", values, "deadline");
            return (Criteria) this;
        }

        public Criteria andDeadlineBetween(String value1, String value2) {
            addCriterion("deadline between", value1, value2, "deadline");
            return (Criteria) this;
        }

        public Criteria andDeadlineNotBetween(String value1, String value2) {
            addCriterion("deadline not between", value1, value2, "deadline");
            return (Criteria) this;
        }

        public Criteria andRelateIdIsNull() {
            addCriterion("relate_id is null");
            return (Criteria) this;
        }

        public Criteria andRelateIdIsNotNull() {
            addCriterion("relate_id is not null");
            return (Criteria) this;
        }

        public Criteria andRelateIdEqualTo(String value) {
            addCriterion("relate_id =", value, "relateId");
            return (Criteria) this;
        }

        public Criteria andRelateIdNotEqualTo(String value) {
            addCriterion("relate_id <>", value, "relateId");
            return (Criteria) this;
        }

        public Criteria andRelateIdGreaterThan(String value) {
            addCriterion("relate_id >", value, "relateId");
            return (Criteria) this;
        }

        public Criteria andRelateIdGreaterThanOrEqualTo(String value) {
            addCriterion("relate_id >=", value, "relateId");
            return (Criteria) this;
        }

        public Criteria andRelateIdLessThan(String value) {
            addCriterion("relate_id <", value, "relateId");
            return (Criteria) this;
        }

        public Criteria andRelateIdLessThanOrEqualTo(String value) {
            addCriterion("relate_id <=", value, "relateId");
            return (Criteria) this;
        }

        public Criteria andRelateIdLike(String value) {
            addCriterion("relate_id like", value, "relateId");
            return (Criteria) this;
        }

        public Criteria andRelateIdNotLike(String value) {
            addCriterion("relate_id not like", value, "relateId");
            return (Criteria) this;
        }

        public Criteria andRelateIdIn(List<String> values) {
            addCriterion("relate_id in", values, "relateId");
            return (Criteria) this;
        }

        public Criteria andRelateIdNotIn(List<String> values) {
            addCriterion("relate_id not in", values, "relateId");
            return (Criteria) this;
        }

        public Criteria andRelateIdBetween(String value1, String value2) {
            addCriterion("relate_id between", value1, value2, "relateId");
            return (Criteria) this;
        }

        public Criteria andRelateIdNotBetween(String value1, String value2) {
            addCriterion("relate_id not between", value1, value2, "relateId");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Integer value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Integer value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Integer value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Integer value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Integer value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Integer> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Integer> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Integer value1, Integer value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andPaydateIsNull() {
            addCriterion("payDate is null");
            return (Criteria) this;
        }

        public Criteria andPaydateIsNotNull() {
            addCriterion("payDate is not null");
            return (Criteria) this;
        }

        public Criteria andPaydateEqualTo(Date value) {
            addCriterion("payDate =", value, "paydate");
            return (Criteria) this;
        }

        public Criteria andPaydateNotEqualTo(Date value) {
            addCriterion("payDate <>", value, "paydate");
            return (Criteria) this;
        }

        public Criteria andPaydateGreaterThan(Date value) {
            addCriterion("payDate >", value, "paydate");
            return (Criteria) this;
        }

        public Criteria andPaydateGreaterThanOrEqualTo(Date value) {
            addCriterion("payDate >=", value, "paydate");
            return (Criteria) this;
        }

        public Criteria andPaydateLessThan(Date value) {
            addCriterion("payDate <", value, "paydate");
            return (Criteria) this;
        }

        public Criteria andPaydateLessThanOrEqualTo(Date value) {
            addCriterion("payDate <=", value, "paydate");
            return (Criteria) this;
        }

        public Criteria andPaydateIn(List<Date> values) {
            addCriterion("payDate in", values, "paydate");
            return (Criteria) this;
        }

        public Criteria andPaydateNotIn(List<Date> values) {
            addCriterion("payDate not in", values, "paydate");
            return (Criteria) this;
        }

        public Criteria andPaydateBetween(Date value1, Date value2) {
            addCriterion("payDate between", value1, value2, "paydate");
            return (Criteria) this;
        }

        public Criteria andPaydateNotBetween(Date value1, Date value2) {
            addCriterion("payDate not between", value1, value2, "paydate");
            return (Criteria) this;
        }

        public Criteria andPaytypeIsNull() {
            addCriterion("payType is null");
            return (Criteria) this;
        }

        public Criteria andPaytypeIsNotNull() {
            addCriterion("payType is not null");
            return (Criteria) this;
        }

        public Criteria andPaytypeEqualTo(Integer value) {
            addCriterion("payType =", value, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaytypeNotEqualTo(Integer value) {
            addCriterion("payType <>", value, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaytypeGreaterThan(Integer value) {
            addCriterion("payType >", value, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaytypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("payType >=", value, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaytypeLessThan(Integer value) {
            addCriterion("payType <", value, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaytypeLessThanOrEqualTo(Integer value) {
            addCriterion("payType <=", value, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaytypeIn(List<Integer> values) {
            addCriterion("payType in", values, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaytypeNotIn(List<Integer> values) {
            addCriterion("payType not in", values, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaytypeBetween(Integer value1, Integer value2) {
            addCriterion("payType between", value1, value2, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaytypeNotBetween(Integer value1, Integer value2) {
            addCriterion("payType not between", value1, value2, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaystatusIsNull() {
            addCriterion("payStatus is null");
            return (Criteria) this;
        }

        public Criteria andPaystatusIsNotNull() {
            addCriterion("payStatus is not null");
            return (Criteria) this;
        }

        public Criteria andPaystatusEqualTo(Integer value) {
            addCriterion("payStatus =", value, "paystatus");
            return (Criteria) this;
        }

        public Criteria andPaystatusNotEqualTo(Integer value) {
            addCriterion("payStatus <>", value, "paystatus");
            return (Criteria) this;
        }

        public Criteria andPaystatusGreaterThan(Integer value) {
            addCriterion("payStatus >", value, "paystatus");
            return (Criteria) this;
        }

        public Criteria andPaystatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("payStatus >=", value, "paystatus");
            return (Criteria) this;
        }

        public Criteria andPaystatusLessThan(Integer value) {
            addCriterion("payStatus <", value, "paystatus");
            return (Criteria) this;
        }

        public Criteria andPaystatusLessThanOrEqualTo(Integer value) {
            addCriterion("payStatus <=", value, "paystatus");
            return (Criteria) this;
        }

        public Criteria andPaystatusIn(List<Integer> values) {
            addCriterion("payStatus in", values, "paystatus");
            return (Criteria) this;
        }

        public Criteria andPaystatusNotIn(List<Integer> values) {
            addCriterion("payStatus not in", values, "paystatus");
            return (Criteria) this;
        }

        public Criteria andPaystatusBetween(Integer value1, Integer value2) {
            addCriterion("payStatus between", value1, value2, "paystatus");
            return (Criteria) this;
        }

        public Criteria andPaystatusNotBetween(Integer value1, Integer value2) {
            addCriterion("payStatus not between", value1, value2, "paystatus");
            return (Criteria) this;
        }

        public Criteria andDeletestatusIsNull() {
            addCriterion("deleteStatus is null");
            return (Criteria) this;
        }

        public Criteria andDeletestatusIsNotNull() {
            addCriterion("deleteStatus is not null");
            return (Criteria) this;
        }

        public Criteria andDeletestatusEqualTo(Boolean value) {
            addCriterion("deleteStatus =", value, "deletestatus");
            return (Criteria) this;
        }

        public Criteria andDeletestatusNotEqualTo(Boolean value) {
            addCriterion("deleteStatus <>", value, "deletestatus");
            return (Criteria) this;
        }

        public Criteria andDeletestatusGreaterThan(Boolean value) {
            addCriterion("deleteStatus >", value, "deletestatus");
            return (Criteria) this;
        }

        public Criteria andDeletestatusGreaterThanOrEqualTo(Boolean value) {
            addCriterion("deleteStatus >=", value, "deletestatus");
            return (Criteria) this;
        }

        public Criteria andDeletestatusLessThan(Boolean value) {
            addCriterion("deleteStatus <", value, "deletestatus");
            return (Criteria) this;
        }

        public Criteria andDeletestatusLessThanOrEqualTo(Boolean value) {
            addCriterion("deleteStatus <=", value, "deletestatus");
            return (Criteria) this;
        }

        public Criteria andDeletestatusIn(List<Boolean> values) {
            addCriterion("deleteStatus in", values, "deletestatus");
            return (Criteria) this;
        }

        public Criteria andDeletestatusNotIn(List<Boolean> values) {
            addCriterion("deleteStatus not in", values, "deletestatus");
            return (Criteria) this;
        }

        public Criteria andDeletestatusBetween(Boolean value1, Boolean value2) {
            addCriterion("deleteStatus between", value1, value2, "deletestatus");
            return (Criteria) this;
        }

        public Criteria andDeletestatusNotBetween(Boolean value1, Boolean value2) {
            addCriterion("deleteStatus not between", value1, value2, "deletestatus");
            return (Criteria) this;
        }

        public Criteria andAlipayTradeNoIsNull() {
            addCriterion("alipay_trade_no is null");
            return (Criteria) this;
        }

        public Criteria andAlipayTradeNoIsNotNull() {
            addCriterion("alipay_trade_no is not null");
            return (Criteria) this;
        }

        public Criteria andAlipayTradeNoEqualTo(String value) {
            addCriterion("alipay_trade_no =", value, "alipayTradeNo");
            return (Criteria) this;
        }

        public Criteria andAlipayTradeNoNotEqualTo(String value) {
            addCriterion("alipay_trade_no <>", value, "alipayTradeNo");
            return (Criteria) this;
        }

        public Criteria andAlipayTradeNoGreaterThan(String value) {
            addCriterion("alipay_trade_no >", value, "alipayTradeNo");
            return (Criteria) this;
        }

        public Criteria andAlipayTradeNoGreaterThanOrEqualTo(String value) {
            addCriterion("alipay_trade_no >=", value, "alipayTradeNo");
            return (Criteria) this;
        }

        public Criteria andAlipayTradeNoLessThan(String value) {
            addCriterion("alipay_trade_no <", value, "alipayTradeNo");
            return (Criteria) this;
        }

        public Criteria andAlipayTradeNoLessThanOrEqualTo(String value) {
            addCriterion("alipay_trade_no <=", value, "alipayTradeNo");
            return (Criteria) this;
        }

        public Criteria andAlipayTradeNoLike(String value) {
            addCriterion("alipay_trade_no like", value, "alipayTradeNo");
            return (Criteria) this;
        }

        public Criteria andAlipayTradeNoNotLike(String value) {
            addCriterion("alipay_trade_no not like", value, "alipayTradeNo");
            return (Criteria) this;
        }

        public Criteria andAlipayTradeNoIn(List<String> values) {
            addCriterion("alipay_trade_no in", values, "alipayTradeNo");
            return (Criteria) this;
        }

        public Criteria andAlipayTradeNoNotIn(List<String> values) {
            addCriterion("alipay_trade_no not in", values, "alipayTradeNo");
            return (Criteria) this;
        }

        public Criteria andAlipayTradeNoBetween(String value1, String value2) {
            addCriterion("alipay_trade_no between", value1, value2, "alipayTradeNo");
            return (Criteria) this;
        }

        public Criteria andAlipayTradeNoNotBetween(String value1, String value2) {
            addCriterion("alipay_trade_no not between", value1, value2, "alipayTradeNo");
            return (Criteria) this;
        }

        public Criteria andWeixinTradeNoIsNull() {
            addCriterion("weixin_trade_no is null");
            return (Criteria) this;
        }

        public Criteria andWeixinTradeNoIsNotNull() {
            addCriterion("weixin_trade_no is not null");
            return (Criteria) this;
        }

        public Criteria andWeixinTradeNoEqualTo(String value) {
            addCriterion("weixin_trade_no =", value, "weixinTradeNo");
            return (Criteria) this;
        }

        public Criteria andWeixinTradeNoNotEqualTo(String value) {
            addCriterion("weixin_trade_no <>", value, "weixinTradeNo");
            return (Criteria) this;
        }

        public Criteria andWeixinTradeNoGreaterThan(String value) {
            addCriterion("weixin_trade_no >", value, "weixinTradeNo");
            return (Criteria) this;
        }

        public Criteria andWeixinTradeNoGreaterThanOrEqualTo(String value) {
            addCriterion("weixin_trade_no >=", value, "weixinTradeNo");
            return (Criteria) this;
        }

        public Criteria andWeixinTradeNoLessThan(String value) {
            addCriterion("weixin_trade_no <", value, "weixinTradeNo");
            return (Criteria) this;
        }

        public Criteria andWeixinTradeNoLessThanOrEqualTo(String value) {
            addCriterion("weixin_trade_no <=", value, "weixinTradeNo");
            return (Criteria) this;
        }

        public Criteria andWeixinTradeNoLike(String value) {
            addCriterion("weixin_trade_no like", value, "weixinTradeNo");
            return (Criteria) this;
        }

        public Criteria andWeixinTradeNoNotLike(String value) {
            addCriterion("weixin_trade_no not like", value, "weixinTradeNo");
            return (Criteria) this;
        }

        public Criteria andWeixinTradeNoIn(List<String> values) {
            addCriterion("weixin_trade_no in", values, "weixinTradeNo");
            return (Criteria) this;
        }

        public Criteria andWeixinTradeNoNotIn(List<String> values) {
            addCriterion("weixin_trade_no not in", values, "weixinTradeNo");
            return (Criteria) this;
        }

        public Criteria andWeixinTradeNoBetween(String value1, String value2) {
            addCriterion("weixin_trade_no between", value1, value2, "weixinTradeNo");
            return (Criteria) this;
        }

        public Criteria andWeixinTradeNoNotBetween(String value1, String value2) {
            addCriterion("weixin_trade_no not between", value1, value2, "weixinTradeNo");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}