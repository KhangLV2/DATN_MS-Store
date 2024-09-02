package com.example.java4.repositories.NoMap;

import com.example.java4.entities.noMap.ChiTietSanPhamNoMap;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SPCTRepoNoMap
        extends JpaRepository<ChiTietSanPhamNoMap,String> , JpaSpecificationExecutor<ChiTietSanPhamNoMap>
{
     @Query("select ctsp from ChiTietSanPhamNoMap ctsp where  ctsp.idSanPham=:idsp and ctsp.idMauSac=:idms and ctsp.idKichThuoc=:idkt and ctsp.idChatLieu=:idcl and ctsp.idKieuTay=:idkta")
     ChiTietSanPhamNoMap findDuplicatedRecord(@Param("idsp") String idsp,@Param("idms") String idms,@Param("idkt") String idkt,@Param("idcl") String idcl, @Param("idkta") String idkta);
};
