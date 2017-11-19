package com.wangsd.web.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PropertyinfoExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public PropertyinfoExample() {
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

        public Criteria andCodeIsNull() {
            addCriterion("code is null");
            return (Criteria) this;
        }

        public Criteria andCodeIsNotNull() {
            addCriterion("code is not null");
            return (Criteria) this;
        }

        public Criteria andCodeEqualTo(String value) {
            addCriterion("code =", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeNotEqualTo(String value) {
            addCriterion("code <>", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeGreaterThan(String value) {
            addCriterion("code >", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeGreaterThanOrEqualTo(String value) {
            addCriterion("code >=", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeLessThan(String value) {
            addCriterion("code <", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeLessThanOrEqualTo(String value) {
            addCriterion("code <=", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeLike(String value) {
            addCriterion("code like", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeNotLike(String value) {
            addCriterion("code not like", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeIn(List<String> values) {
            addCriterion("code in", values, "code");
            return (Criteria) this;
        }

        public Criteria andCodeNotIn(List<String> values) {
            addCriterion("code not in", values, "code");
            return (Criteria) this;
        }

        public Criteria andCodeBetween(String value1, String value2) {
            addCriterion("code between", value1, value2, "code");
            return (Criteria) this;
        }

        public Criteria andCodeNotBetween(String value1, String value2) {
            addCriterion("code not between", value1, value2, "code");
            return (Criteria) this;
        }

        public Criteria andNameIsNull() {
            addCriterion("name is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("name is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("name =", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("name <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("name >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("name >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("name <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("name <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("name like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("name not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("name in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("name not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("name between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("name not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andContactPeopleIsNull() {
            addCriterion("contact_people is null");
            return (Criteria) this;
        }

        public Criteria andContactPeopleIsNotNull() {
            addCriterion("contact_people is not null");
            return (Criteria) this;
        }

        public Criteria andContactPeopleEqualTo(String value) {
            addCriterion("contact_people =", value, "contactPeople");
            return (Criteria) this;
        }

        public Criteria andContactPeopleNotEqualTo(String value) {
            addCriterion("contact_people <>", value, "contactPeople");
            return (Criteria) this;
        }

        public Criteria andContactPeopleGreaterThan(String value) {
            addCriterion("contact_people >", value, "contactPeople");
            return (Criteria) this;
        }

        public Criteria andContactPeopleGreaterThanOrEqualTo(String value) {
            addCriterion("contact_people >=", value, "contactPeople");
            return (Criteria) this;
        }

        public Criteria andContactPeopleLessThan(String value) {
            addCriterion("contact_people <", value, "contactPeople");
            return (Criteria) this;
        }

        public Criteria andContactPeopleLessThanOrEqualTo(String value) {
            addCriterion("contact_people <=", value, "contactPeople");
            return (Criteria) this;
        }

        public Criteria andContactPeopleLike(String value) {
            addCriterion("contact_people like", value, "contactPeople");
            return (Criteria) this;
        }

        public Criteria andContactPeopleNotLike(String value) {
            addCriterion("contact_people not like", value, "contactPeople");
            return (Criteria) this;
        }

        public Criteria andContactPeopleIn(List<String> values) {
            addCriterion("contact_people in", values, "contactPeople");
            return (Criteria) this;
        }

        public Criteria andContactPeopleNotIn(List<String> values) {
            addCriterion("contact_people not in", values, "contactPeople");
            return (Criteria) this;
        }

        public Criteria andContactPeopleBetween(String value1, String value2) {
            addCriterion("contact_people between", value1, value2, "contactPeople");
            return (Criteria) this;
        }

        public Criteria andContactPeopleNotBetween(String value1, String value2) {
            addCriterion("contact_people not between", value1, value2, "contactPeople");
            return (Criteria) this;
        }

        public Criteria andContactPhoneIsNull() {
            addCriterion("contact_phone is null");
            return (Criteria) this;
        }

        public Criteria andContactPhoneIsNotNull() {
            addCriterion("contact_phone is not null");
            return (Criteria) this;
        }

        public Criteria andContactPhoneEqualTo(String value) {
            addCriterion("contact_phone =", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneNotEqualTo(String value) {
            addCriterion("contact_phone <>", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneGreaterThan(String value) {
            addCriterion("contact_phone >", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("contact_phone >=", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneLessThan(String value) {
            addCriterion("contact_phone <", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneLessThanOrEqualTo(String value) {
            addCriterion("contact_phone <=", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneLike(String value) {
            addCriterion("contact_phone like", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneNotLike(String value) {
            addCriterion("contact_phone not like", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneIn(List<String> values) {
            addCriterion("contact_phone in", values, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneNotIn(List<String> values) {
            addCriterion("contact_phone not in", values, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneBetween(String value1, String value2) {
            addCriterion("contact_phone between", value1, value2, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneNotBetween(String value1, String value2) {
            addCriterion("contact_phone not between", value1, value2, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactAddressIsNull() {
            addCriterion("contact_address is null");
            return (Criteria) this;
        }

        public Criteria andContactAddressIsNotNull() {
            addCriterion("contact_address is not null");
            return (Criteria) this;
        }

        public Criteria andContactAddressEqualTo(String value) {
            addCriterion("contact_address =", value, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressNotEqualTo(String value) {
            addCriterion("contact_address <>", value, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressGreaterThan(String value) {
            addCriterion("contact_address >", value, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressGreaterThanOrEqualTo(String value) {
            addCriterion("contact_address >=", value, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressLessThan(String value) {
            addCriterion("contact_address <", value, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressLessThanOrEqualTo(String value) {
            addCriterion("contact_address <=", value, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressLike(String value) {
            addCriterion("contact_address like", value, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressNotLike(String value) {
            addCriterion("contact_address not like", value, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressIn(List<String> values) {
            addCriterion("contact_address in", values, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressNotIn(List<String> values) {
            addCriterion("contact_address not in", values, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressBetween(String value1, String value2) {
            addCriterion("contact_address between", value1, value2, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andContactAddressNotBetween(String value1, String value2) {
            addCriterion("contact_address not between", value1, value2, "contactAddress");
            return (Criteria) this;
        }

        public Criteria andParentIdIsNull() {
            addCriterion("parent_id is null");
            return (Criteria) this;
        }

        public Criteria andParentIdIsNotNull() {
            addCriterion("parent_id is not null");
            return (Criteria) this;
        }

        public Criteria andParentIdEqualTo(Integer value) {
            addCriterion("parent_id =", value, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdNotEqualTo(Integer value) {
            addCriterion("parent_id <>", value, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdGreaterThan(Integer value) {
            addCriterion("parent_id >", value, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("parent_id >=", value, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdLessThan(Integer value) {
            addCriterion("parent_id <", value, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdLessThanOrEqualTo(Integer value) {
            addCriterion("parent_id <=", value, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdIn(List<Integer> values) {
            addCriterion("parent_id in", values, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdNotIn(List<Integer> values) {
            addCriterion("parent_id not in", values, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdBetween(Integer value1, Integer value2) {
            addCriterion("parent_id between", value1, value2, "parentId");
            return (Criteria) this;
        }

        public Criteria andParentIdNotBetween(Integer value1, Integer value2) {
            addCriterion("parent_id not between", value1, value2, "parentId");
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

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
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