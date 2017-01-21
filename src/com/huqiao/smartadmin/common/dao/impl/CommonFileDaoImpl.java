package com.huqiao.smartadmin.common.dao.impl;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.huqiao.smartadmin.common.dao.ICommonFileDao;
import com.huqiao.smartadmin.common.entity.CommonFile;
import com.huqiao.smartadmin.util.web.Page;

/**
 * 文件Dao实现
 * @author NOVOTS
 * @version Version 1.0
 */
@Repository
public class CommonFileDaoImpl extends BaseDaoImpl<CommonFile> implements ICommonFileDao {

    @Override
    public Long findRowCount(CommonFile filee) {
        Criteria criteria = getSession().createCriteria(CommonFile.class).setProjection(Projections.rowCount());
        addQueryCause(criteria,filee);
        return (Long) criteria.uniqueResult();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<CommonFile> findPage(CommonFile filee, int first, int maxNum,String orderField,String orderDirection) {
        Criteria criteria = getSession().createCriteria(CommonFile.class).setFirstResult(first).setMaxResults(maxNum);
        addQueryCause(criteria,filee);
        if(orderField!=null){
        	if(orderDirection==null || orderDirection.trim().equals("asc")){
        		criteria.addOrder(Order.asc(orderField));
        	}else{
        		criteria.addOrder(Order.desc(orderField));
        	}
        }else{
        	criteria.addOrder(Order.asc("id"));
        }
        return criteria.list();
    }
    /**
     * 根据查询对象往criteria对象增加查询条件
     * @param criteria hibernate criteria对象
     * @param filee 查询对象
     */
    private void addQueryCause(Criteria criteria,CommonFile filee){
		if (filee.getName() != null && !filee.getName().trim().equals("")) {
			criteria.add(Restrictions.like("name", filee.getName(), MatchMode.ANYWHERE));
		}
		if (filee.getCreateDateStart() != null) {
			criteria.add(Restrictions.ge("createDate", filee.getCreateDateStart()));
		}
		if (filee.getCreateDateEnd() != null) {
			criteria.add(Restrictions.le("createDate", filee.getCreateDateEnd()));
		}
		if (filee.getExtensionName() != null && !filee.getExtensionName().trim().equals("")) {
			criteria.add(Restrictions.like("extensionName", filee.getExtensionName(), MatchMode.ANYWHERE));
		}
		if (filee.getFolder() != null) {
			criteria.add(Restrictions.eq("folder", filee.getFolder()));
		}
	}

	/* (非 Javadoc)
	 * <p>Title: findByKey</p>
	 * <p>Description: </p>
	 * @param queryKey
	 * @return
	 * @see com.huqiao.smartadmin.common.dao.ICommonFileDao#findByKey(Page pageInfo,java.lang.String)
	 */
	@Override
	public List<CommonFile> findByKey(Page pageInfo,String queryKey) {
		Criteria criteria = getSession().createCriteria(CommonFile.class).setFirstResult(pageInfo.getStartIndex()).setMaxResults(pageInfo.getNumPerPage()).add(Restrictions.like("manageKey", queryKey,MatchMode.ANYWHERE));
		return criteria.list();
	}

	/* (非 Javadoc)
	 * <p>Title: findRowCount</p>
	 * <p>Description: </p>
	 * @param queryKey
	 * @return
	 * @see com.huqiao.smartadmin.common.dao.ICommonFileDao#findRowCount(java.lang.String)
	 */
	@Override
	public Long findRowCount(String queryKey) {
		// TODO Auto-generated method stub
		Criteria criteria = getSession().createCriteria(CommonFile.class)
				.setProjection(Projections.rowCount())
				.add(Restrictions.like("manageKey", queryKey,MatchMode.ANYWHERE));
		return (Long) criteria.uniqueResult();
	}

}
