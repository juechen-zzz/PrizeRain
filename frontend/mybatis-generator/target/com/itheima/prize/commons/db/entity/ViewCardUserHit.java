package com.itheima.prize.commons.db.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ViewCardUserHit implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column view_card_user_hit.id
     *
     * @mbg.generated
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column view_card_user_hit.title
     *
     * @mbg.generated
     */
    private String title;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column view_card_user_hit.type
     *
     * @mbg.generated
     */
    private String type;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column view_card_user_hit.uname
     *
     * @mbg.generated
     */
    private String uname;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column view_card_user_hit.realname
     *
     * @mbg.generated
     */
    private String realname;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column view_card_user_hit.idcard
     *
     * @mbg.generated
     */
    private String idcard;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column view_card_user_hit.phone
     *
     * @mbg.generated
     */
    private String phone;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column view_card_user_hit.level
     *
     * @mbg.generated
     */
    private String level;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column view_card_user_hit.name
     *
     * @mbg.generated
     */
    private String name;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column view_card_user_hit.price
     *
     * @mbg.generated
     */
    private BigDecimal price;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column view_card_user_hit.gameid
     *
     * @mbg.generated
     */
    private Integer gameid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column view_card_user_hit.userid
     *
     * @mbg.generated
     */
    private Integer userid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column view_card_user_hit.productid
     *
     * @mbg.generated
     */
    private Integer productid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column view_card_user_hit.hittime
     *
     * @mbg.generated
     */
    private Date hittime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table view_card_user_hit
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column view_card_user_hit.id
     *
     * @return the value of view_card_user_hit.id
     *
     * @mbg.generated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column view_card_user_hit.id
     *
     * @param id the value for view_card_user_hit.id
     *
     * @mbg.generated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column view_card_user_hit.title
     *
     * @return the value of view_card_user_hit.title
     *
     * @mbg.generated
     */
    public String getTitle() {
        return title;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column view_card_user_hit.title
     *
     * @param title the value for view_card_user_hit.title
     *
     * @mbg.generated
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column view_card_user_hit.type
     *
     * @return the value of view_card_user_hit.type
     *
     * @mbg.generated
     */
    public String getType() {
        return type;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column view_card_user_hit.type
     *
     * @param type the value for view_card_user_hit.type
     *
     * @mbg.generated
     */
    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column view_card_user_hit.uname
     *
     * @return the value of view_card_user_hit.uname
     *
     * @mbg.generated
     */
    public String getUname() {
        return uname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column view_card_user_hit.uname
     *
     * @param uname the value for view_card_user_hit.uname
     *
     * @mbg.generated
     */
    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column view_card_user_hit.realname
     *
     * @return the value of view_card_user_hit.realname
     *
     * @mbg.generated
     */
    public String getRealname() {
        return realname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column view_card_user_hit.realname
     *
     * @param realname the value for view_card_user_hit.realname
     *
     * @mbg.generated
     */
    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column view_card_user_hit.idcard
     *
     * @return the value of view_card_user_hit.idcard
     *
     * @mbg.generated
     */
    public String getIdcard() {
        return idcard;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column view_card_user_hit.idcard
     *
     * @param idcard the value for view_card_user_hit.idcard
     *
     * @mbg.generated
     */
    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column view_card_user_hit.phone
     *
     * @return the value of view_card_user_hit.phone
     *
     * @mbg.generated
     */
    public String getPhone() {
        return phone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column view_card_user_hit.phone
     *
     * @param phone the value for view_card_user_hit.phone
     *
     * @mbg.generated
     */
    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column view_card_user_hit.level
     *
     * @return the value of view_card_user_hit.level
     *
     * @mbg.generated
     */
    public String getLevel() {
        return level;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column view_card_user_hit.level
     *
     * @param level the value for view_card_user_hit.level
     *
     * @mbg.generated
     */
    public void setLevel(String level) {
        this.level = level == null ? null : level.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column view_card_user_hit.name
     *
     * @return the value of view_card_user_hit.name
     *
     * @mbg.generated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column view_card_user_hit.name
     *
     * @param name the value for view_card_user_hit.name
     *
     * @mbg.generated
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column view_card_user_hit.price
     *
     * @return the value of view_card_user_hit.price
     *
     * @mbg.generated
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column view_card_user_hit.price
     *
     * @param price the value for view_card_user_hit.price
     *
     * @mbg.generated
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column view_card_user_hit.gameid
     *
     * @return the value of view_card_user_hit.gameid
     *
     * @mbg.generated
     */
    public Integer getGameid() {
        return gameid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column view_card_user_hit.gameid
     *
     * @param gameid the value for view_card_user_hit.gameid
     *
     * @mbg.generated
     */
    public void setGameid(Integer gameid) {
        this.gameid = gameid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column view_card_user_hit.userid
     *
     * @return the value of view_card_user_hit.userid
     *
     * @mbg.generated
     */
    public Integer getUserid() {
        return userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column view_card_user_hit.userid
     *
     * @param userid the value for view_card_user_hit.userid
     *
     * @mbg.generated
     */
    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column view_card_user_hit.productid
     *
     * @return the value of view_card_user_hit.productid
     *
     * @mbg.generated
     */
    public Integer getProductid() {
        return productid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column view_card_user_hit.productid
     *
     * @param productid the value for view_card_user_hit.productid
     *
     * @mbg.generated
     */
    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column view_card_user_hit.hittime
     *
     * @return the value of view_card_user_hit.hittime
     *
     * @mbg.generated
     */
    public Date getHittime() {
        return hittime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column view_card_user_hit.hittime
     *
     * @param hittime the value for view_card_user_hit.hittime
     *
     * @mbg.generated
     */
    public void setHittime(Date hittime) {
        this.hittime = hittime;
    }
}