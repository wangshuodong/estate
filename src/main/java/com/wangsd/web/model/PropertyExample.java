package com.wangsd.web.model;

import java.util.ArrayList;
import java.util.List;

public class PropertyExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public PropertyExample() {
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

        public Criteria andDepartmentIdIsNull() {
            addCriterion("department_id is null");
            return (Criteria) this;
        }

        public Criteria andDepartmentIdIsNotNull() {
            addCriterion("department_id is not null");
            return (Criteria) this;
        }

        public Criteria andDepartmentIdEqualTo(Integer value) {
            addCriterion("department_id =", value, "departmentId");
            return (Criteria) this;
        }

        public Criteria andDepartmentIdNotEqualTo(Integer value) {
            addCriterion("department_id <>", value, "departmentId");
            return (Criteria) this;
        }

        public Criteria andDepartmentIdGreaterThan(Integer value) {
            addCriterion("department_id >", value, "departmentId");
            return (Criteria) this;
        }

        public Criteria andDepartmentIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("department_id >=", value, "departmentId");
            return (Criteria) this;
        }

        public Criteria andDepartmentIdLessThan(Integer value) {
            addCriterion("department_id <", value, "departmentId");
            return (Criteria) this;
        }

        public Criteria andDepartmentIdLessThanOrEqualTo(Integer value) {
            addCriterion("department_id <=", value, "departmentId");
            return (Criteria) this;
        }

        public Criteria andDepartmentIdIn(List<Integer> values) {
            addCriterion("department_id in", values, "departmentId");
            return (Criteria) this;
        }

        public Criteria andDepartmentIdNotIn(List<Integer> values) {
            addCriterion("department_id not in", values, "departmentId");
            return (Criteria) this;
        }

        public Criteria andDepartmentIdBetween(Integer value1, Integer value2) {
            addCriterion("department_id between", value1, value2, "departmentId");
            return (Criteria) this;
        }

        public Criteria andDepartmentIdNotBetween(Integer value1, Integer value2) {
            addCriterion("department_id not between", value1, value2, "departmentId");
            return (Criteria) this;
        }

        public Criteria andAlipayLoginIdIsNull() {
            addCriterion("alipay_login_id is null");
            return (Criteria) this;
        }

        public Criteria andAlipayLoginIdIsNotNull() {
            addCriterion("alipay_login_id is not null");
            return (Criteria) this;
        }

        public Criteria andAlipayLoginIdEqualTo(String value) {
            addCriterion("alipay_login_id =", value, "alipayLoginId");
            return (Criteria) this;
        }

        public Criteria andAlipayLoginIdNotEqualTo(String value) {
            addCriterion("alipay_login_id <>", value, "alipayLoginId");
            return (Criteria) this;
        }

        public Criteria andAlipayLoginIdGreaterThan(String value) {
            addCriterion("alipay_login_id >", value, "alipayLoginId");
            return (Criteria) this;
        }

        public Criteria andAlipayLoginIdGreaterThanOrEqualTo(String value) {
            addCriterion("alipay_login_id >=", value, "alipayLoginId");
            return (Criteria) this;
        }

        public Criteria andAlipayLoginIdLessThan(String value) {
            addCriterion("alipay_login_id <", value, "alipayLoginId");
            return (Criteria) this;
        }

        public Criteria andAlipayLoginIdLessThanOrEqualTo(String value) {
            addCriterion("alipay_login_id <=", value, "alipayLoginId");
            return (Criteria) this;
        }

        public Criteria andAlipayLoginIdLike(String value) {
            addCriterion("alipay_login_id like", value, "alipayLoginId");
            return (Criteria) this;
        }

        public Criteria andAlipayLoginIdNotLike(String value) {
            addCriterion("alipay_login_id not like", value, "alipayLoginId");
            return (Criteria) this;
        }

        public Criteria andAlipayLoginIdIn(List<String> values) {
            addCriterion("alipay_login_id in", values, "alipayLoginId");
            return (Criteria) this;
        }

        public Criteria andAlipayLoginIdNotIn(List<String> values) {
            addCriterion("alipay_login_id not in", values, "alipayLoginId");
            return (Criteria) this;
        }

        public Criteria andAlipayLoginIdBetween(String value1, String value2) {
            addCriterion("alipay_login_id between", value1, value2, "alipayLoginId");
            return (Criteria) this;
        }

        public Criteria andAlipayLoginIdNotBetween(String value1, String value2) {
            addCriterion("alipay_login_id not between", value1, value2, "alipayLoginId");
            return (Criteria) this;
        }

        public Criteria andAppIdIsNull() {
            addCriterion("app_id is null");
            return (Criteria) this;
        }

        public Criteria andAppIdIsNotNull() {
            addCriterion("app_id is not null");
            return (Criteria) this;
        }

        public Criteria andAppIdEqualTo(String value) {
            addCriterion("app_id =", value, "appId");
            return (Criteria) this;
        }

        public Criteria andAppIdNotEqualTo(String value) {
            addCriterion("app_id <>", value, "appId");
            return (Criteria) this;
        }

        public Criteria andAppIdGreaterThan(String value) {
            addCriterion("app_id >", value, "appId");
            return (Criteria) this;
        }

        public Criteria andAppIdGreaterThanOrEqualTo(String value) {
            addCriterion("app_id >=", value, "appId");
            return (Criteria) this;
        }

        public Criteria andAppIdLessThan(String value) {
            addCriterion("app_id <", value, "appId");
            return (Criteria) this;
        }

        public Criteria andAppIdLessThanOrEqualTo(String value) {
            addCriterion("app_id <=", value, "appId");
            return (Criteria) this;
        }

        public Criteria andAppIdLike(String value) {
            addCriterion("app_id like", value, "appId");
            return (Criteria) this;
        }

        public Criteria andAppIdNotLike(String value) {
            addCriterion("app_id not like", value, "appId");
            return (Criteria) this;
        }

        public Criteria andAppIdIn(List<String> values) {
            addCriterion("app_id in", values, "appId");
            return (Criteria) this;
        }

        public Criteria andAppIdNotIn(List<String> values) {
            addCriterion("app_id not in", values, "appId");
            return (Criteria) this;
        }

        public Criteria andAppIdBetween(String value1, String value2) {
            addCriterion("app_id between", value1, value2, "appId");
            return (Criteria) this;
        }

        public Criteria andAppIdNotBetween(String value1, String value2) {
            addCriterion("app_id not between", value1, value2, "appId");
            return (Criteria) this;
        }

        public Criteria andTokenIsNull() {
            addCriterion("token is null");
            return (Criteria) this;
        }

        public Criteria andTokenIsNotNull() {
            addCriterion("token is not null");
            return (Criteria) this;
        }

        public Criteria andTokenEqualTo(String value) {
            addCriterion("token =", value, "token");
            return (Criteria) this;
        }

        public Criteria andTokenNotEqualTo(String value) {
            addCriterion("token <>", value, "token");
            return (Criteria) this;
        }

        public Criteria andTokenGreaterThan(String value) {
            addCriterion("token >", value, "token");
            return (Criteria) this;
        }

        public Criteria andTokenGreaterThanOrEqualTo(String value) {
            addCriterion("token >=", value, "token");
            return (Criteria) this;
        }

        public Criteria andTokenLessThan(String value) {
            addCriterion("token <", value, "token");
            return (Criteria) this;
        }

        public Criteria andTokenLessThanOrEqualTo(String value) {
            addCriterion("token <=", value, "token");
            return (Criteria) this;
        }

        public Criteria andTokenLike(String value) {
            addCriterion("token like", value, "token");
            return (Criteria) this;
        }

        public Criteria andTokenNotLike(String value) {
            addCriterion("token not like", value, "token");
            return (Criteria) this;
        }

        public Criteria andTokenIn(List<String> values) {
            addCriterion("token in", values, "token");
            return (Criteria) this;
        }

        public Criteria andTokenNotIn(List<String> values) {
            addCriterion("token not in", values, "token");
            return (Criteria) this;
        }

        public Criteria andTokenBetween(String value1, String value2) {
            addCriterion("token between", value1, value2, "token");
            return (Criteria) this;
        }

        public Criteria andTokenNotBetween(String value1, String value2) {
            addCriterion("token not between", value1, value2, "token");
            return (Criteria) this;
        }

        public Criteria andAlipayDebitNumIsNull() {
            addCriterion("alipay_debit_num is null");
            return (Criteria) this;
        }

        public Criteria andAlipayDebitNumIsNotNull() {
            addCriterion("alipay_debit_num is not null");
            return (Criteria) this;
        }

        public Criteria andAlipayDebitNumEqualTo(String value) {
            addCriterion("alipay_debit_num =", value, "alipayDebitNum");
            return (Criteria) this;
        }

        public Criteria andAlipayDebitNumNotEqualTo(String value) {
            addCriterion("alipay_debit_num <>", value, "alipayDebitNum");
            return (Criteria) this;
        }

        public Criteria andAlipayDebitNumGreaterThan(String value) {
            addCriterion("alipay_debit_num >", value, "alipayDebitNum");
            return (Criteria) this;
        }

        public Criteria andAlipayDebitNumGreaterThanOrEqualTo(String value) {
            addCriterion("alipay_debit_num >=", value, "alipayDebitNum");
            return (Criteria) this;
        }

        public Criteria andAlipayDebitNumLessThan(String value) {
            addCriterion("alipay_debit_num <", value, "alipayDebitNum");
            return (Criteria) this;
        }

        public Criteria andAlipayDebitNumLessThanOrEqualTo(String value) {
            addCriterion("alipay_debit_num <=", value, "alipayDebitNum");
            return (Criteria) this;
        }

        public Criteria andAlipayDebitNumLike(String value) {
            addCriterion("alipay_debit_num like", value, "alipayDebitNum");
            return (Criteria) this;
        }

        public Criteria andAlipayDebitNumNotLike(String value) {
            addCriterion("alipay_debit_num not like", value, "alipayDebitNum");
            return (Criteria) this;
        }

        public Criteria andAlipayDebitNumIn(List<String> values) {
            addCriterion("alipay_debit_num in", values, "alipayDebitNum");
            return (Criteria) this;
        }

        public Criteria andAlipayDebitNumNotIn(List<String> values) {
            addCriterion("alipay_debit_num not in", values, "alipayDebitNum");
            return (Criteria) this;
        }

        public Criteria andAlipayDebitNumBetween(String value1, String value2) {
            addCriterion("alipay_debit_num between", value1, value2, "alipayDebitNum");
            return (Criteria) this;
        }

        public Criteria andAlipayDebitNumNotBetween(String value1, String value2) {
            addCriterion("alipay_debit_num not between", value1, value2, "alipayDebitNum");
            return (Criteria) this;
        }

        public Criteria andWeixinDebitNumIsNull() {
            addCriterion("weixin_debit_num is null");
            return (Criteria) this;
        }

        public Criteria andWeixinDebitNumIsNotNull() {
            addCriterion("weixin_debit_num is not null");
            return (Criteria) this;
        }

        public Criteria andWeixinDebitNumEqualTo(String value) {
            addCriterion("weixin_debit_num =", value, "weixinDebitNum");
            return (Criteria) this;
        }

        public Criteria andWeixinDebitNumNotEqualTo(String value) {
            addCriterion("weixin_debit_num <>", value, "weixinDebitNum");
            return (Criteria) this;
        }

        public Criteria andWeixinDebitNumGreaterThan(String value) {
            addCriterion("weixin_debit_num >", value, "weixinDebitNum");
            return (Criteria) this;
        }

        public Criteria andWeixinDebitNumGreaterThanOrEqualTo(String value) {
            addCriterion("weixin_debit_num >=", value, "weixinDebitNum");
            return (Criteria) this;
        }

        public Criteria andWeixinDebitNumLessThan(String value) {
            addCriterion("weixin_debit_num <", value, "weixinDebitNum");
            return (Criteria) this;
        }

        public Criteria andWeixinDebitNumLessThanOrEqualTo(String value) {
            addCriterion("weixin_debit_num <=", value, "weixinDebitNum");
            return (Criteria) this;
        }

        public Criteria andWeixinDebitNumLike(String value) {
            addCriterion("weixin_debit_num like", value, "weixinDebitNum");
            return (Criteria) this;
        }

        public Criteria andWeixinDebitNumNotLike(String value) {
            addCriterion("weixin_debit_num not like", value, "weixinDebitNum");
            return (Criteria) this;
        }

        public Criteria andWeixinDebitNumIn(List<String> values) {
            addCriterion("weixin_debit_num in", values, "weixinDebitNum");
            return (Criteria) this;
        }

        public Criteria andWeixinDebitNumNotIn(List<String> values) {
            addCriterion("weixin_debit_num not in", values, "weixinDebitNum");
            return (Criteria) this;
        }

        public Criteria andWeixinDebitNumBetween(String value1, String value2) {
            addCriterion("weixin_debit_num between", value1, value2, "weixinDebitNum");
            return (Criteria) this;
        }

        public Criteria andWeixinDebitNumNotBetween(String value1, String value2) {
            addCriterion("weixin_debit_num not between", value1, value2, "weixinDebitNum");
            return (Criteria) this;
        }

        public Criteria andWeixinChildrenNumIsNull() {
            addCriterion("weixin_children_num is null");
            return (Criteria) this;
        }

        public Criteria andWeixinChildrenNumIsNotNull() {
            addCriterion("weixin_children_num is not null");
            return (Criteria) this;
        }

        public Criteria andWeixinChildrenNumEqualTo(String value) {
            addCriterion("weixin_children_num =", value, "weixinChildrenNum");
            return (Criteria) this;
        }

        public Criteria andWeixinChildrenNumNotEqualTo(String value) {
            addCriterion("weixin_children_num <>", value, "weixinChildrenNum");
            return (Criteria) this;
        }

        public Criteria andWeixinChildrenNumGreaterThan(String value) {
            addCriterion("weixin_children_num >", value, "weixinChildrenNum");
            return (Criteria) this;
        }

        public Criteria andWeixinChildrenNumGreaterThanOrEqualTo(String value) {
            addCriterion("weixin_children_num >=", value, "weixinChildrenNum");
            return (Criteria) this;
        }

        public Criteria andWeixinChildrenNumLessThan(String value) {
            addCriterion("weixin_children_num <", value, "weixinChildrenNum");
            return (Criteria) this;
        }

        public Criteria andWeixinChildrenNumLessThanOrEqualTo(String value) {
            addCriterion("weixin_children_num <=", value, "weixinChildrenNum");
            return (Criteria) this;
        }

        public Criteria andWeixinChildrenNumLike(String value) {
            addCriterion("weixin_children_num like", value, "weixinChildrenNum");
            return (Criteria) this;
        }

        public Criteria andWeixinChildrenNumNotLike(String value) {
            addCriterion("weixin_children_num not like", value, "weixinChildrenNum");
            return (Criteria) this;
        }

        public Criteria andWeixinChildrenNumIn(List<String> values) {
            addCriterion("weixin_children_num in", values, "weixinChildrenNum");
            return (Criteria) this;
        }

        public Criteria andWeixinChildrenNumNotIn(List<String> values) {
            addCriterion("weixin_children_num not in", values, "weixinChildrenNum");
            return (Criteria) this;
        }

        public Criteria andWeixinChildrenNumBetween(String value1, String value2) {
            addCriterion("weixin_children_num between", value1, value2, "weixinChildrenNum");
            return (Criteria) this;
        }

        public Criteria andWeixinChildrenNumNotBetween(String value1, String value2) {
            addCriterion("weixin_children_num not between", value1, value2, "weixinChildrenNum");
            return (Criteria) this;
        }

        public Criteria andApiIsNull() {
            addCriterion("api is null");
            return (Criteria) this;
        }

        public Criteria andApiIsNotNull() {
            addCriterion("api is not null");
            return (Criteria) this;
        }

        public Criteria andApiEqualTo(String value) {
            addCriterion("api =", value, "api");
            return (Criteria) this;
        }

        public Criteria andApiNotEqualTo(String value) {
            addCriterion("api <>", value, "api");
            return (Criteria) this;
        }

        public Criteria andApiGreaterThan(String value) {
            addCriterion("api >", value, "api");
            return (Criteria) this;
        }

        public Criteria andApiGreaterThanOrEqualTo(String value) {
            addCriterion("api >=", value, "api");
            return (Criteria) this;
        }

        public Criteria andApiLessThan(String value) {
            addCriterion("api <", value, "api");
            return (Criteria) this;
        }

        public Criteria andApiLessThanOrEqualTo(String value) {
            addCriterion("api <=", value, "api");
            return (Criteria) this;
        }

        public Criteria andApiLike(String value) {
            addCriterion("api like", value, "api");
            return (Criteria) this;
        }

        public Criteria andApiNotLike(String value) {
            addCriterion("api not like", value, "api");
            return (Criteria) this;
        }

        public Criteria andApiIn(List<String> values) {
            addCriterion("api in", values, "api");
            return (Criteria) this;
        }

        public Criteria andApiNotIn(List<String> values) {
            addCriterion("api not in", values, "api");
            return (Criteria) this;
        }

        public Criteria andApiBetween(String value1, String value2) {
            addCriterion("api between", value1, value2, "api");
            return (Criteria) this;
        }

        public Criteria andApiNotBetween(String value1, String value2) {
            addCriterion("api not between", value1, value2, "api");
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