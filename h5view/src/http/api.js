import { get, post } from "./http";

/**
 * 门店会员卡数据
 * @param {Number} p
 * storeId:门店ID
 */
export const apiCardInfo = p => get(`api/card/info/${p}`);

/**
 * 门店微信群数据
 * @param {Number} p
 * storeId:门店ID
 */
export const apiGroupInfo = p => post(`api/group/info/${p}`);

/**
 * 登录
 * @param {Number} p
 * id:门店ID
 */
export const apiLogin = p => get(`api/login/${p}`);
