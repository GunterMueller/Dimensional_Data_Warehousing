/*********************************************************************/
/*                                                                   */
/* promotion_indicator.sql                                           */                  
/*                                                                   */
/*********************************************************************/

-- USE dw;

ALTER TABLE date_dim
ADD promo_ind CHAR(1) -- AFTER year
;

/* end of script                                                     */
