import { get } from "./http";

/**
 * 门店会员卡数据
 * @param {Number} p
 * storeId:门店ID
 */
export const apiCardInfo = p => get(`screen/card/info/${p}`);

/**
 * 门店微信群数据
 * @param {Number} p
 * storeId:门店ID
 */
export const apiGroupInfo = p => get(`screen/group/info/${p}`);

/**
 * 登录
 * @param {Number} p
 * id:门店ID
 */
export const apiLogin = p => get(`screen/login/${p}`);
