<?php

namespace S\VentasBundle\Repository;

use Doctrine\ORM\EntityRepository;
//use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use S\VentasBundle\Entity\Bitacora;

/**
 * BitacoraRe
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class BitacoraRe extends EntityRepository
{   
    public function crear($tabla,$idRegistro,$registro,$user,$ip)
    {
            $users =$this->getEntityManager()
            ->createQuery('SELECT p FROM SVentasBundle:FosUser p where p.id='.$user)
            ->getResult()[0];
            $entity = new Bitacora();
            $entity->setTabla($tabla);
            $entity->setIdRegistro($idRegistro);
            
            $eliminar='S\VentasBundle\Entity'."\\".$tabla;
            $registros=array();
            
            $registro=(array)$registro;
            foreach($registro as $clave => $valor) {
                $clave=str_replace($eliminar,"",$clave);
                $clave=substr($clave, 2);
                if(is_object($valor)){
                   $valor=(array)$valor;
                   $ban=0;
                   foreach($valor as $clave2 => $valor2) {
                        if($ban==0){
                            $registros[$clave]=$valor2;
                            $ban=1;
                        }
                    }
                }else{
                    
                    $registros[$clave]=$valor;  
                }
            }
            $entity->setRegistro($registros);
            $entity->setIdUsuario($users);
            $entity->setIp($ip);
            $entity->setAccion("CREAR");
            $entity->setCreate(new \DateTime('now'));
            $entity->setUpdate(new \DateTime('now'));
            return $entity;
    }

    public function editar($tabla,$idRegistro,$registro,$user,$ip)
    {    
            
            $users =$this->getEntityManager()
            ->createQuery('SELECT p FROM SVentasBundle:FosUser p where p.id='.$user)
            ->getResult()[0];
            $entity = new Bitacora();
            $entity->setTabla($tabla);
    $entity->setIdRegistro($idRegistro);

            $eliminar='S\VentasBundle\Entity'."\\".$tabla;
            $registros=array();
            
            $registro=(array)$registro;
            
            foreach($registro as $clave => $valor) {
                $clave=str_replace($eliminar,"",$clave);
                $clave=substr($clave, 2);
                if(is_object($valor)){
                    $valor=(array)$valor;
                   $ban=0;
                   foreach($valor as $clave2 => $valor2) {
                        if($ban==0){
                            $registros[$clave]=$valor2;
                            $ban=1;
                        }
                    } 
                }else{
                    
                    $registros[$clave]=$valor;  
                }
            }
            $entity->setRegistro($registros);
            $entity->setIdUsuario($users);
            $entity->setIp($ip);
            $entity->setAccion("EDITAR");
            $entity->setCreate(new \DateTime('now'));
            $entity->setUpdate(new \DateTime('now'));
            return $entity;
    }

    public function eliminar($tabla,$idRegistro,$registro,$user,$ip)
    {
            $users =$this->getEntityManager()
            ->createQuery('SELECT p FROM SVentasBundle:FosUser p where p.id='.$user)
            ->getResult()[0];
            $entity = new Bitacora();
            $entity->setTabla($tabla);
            $entity->setIdRegistro($idRegistro);
            $eliminar='S\VentasBundle\Entity'."\\".$tabla;
            $registros=array();
            $registro=(array)$registro;
            foreach($registro as $clave => $valor) {
                $clave=str_replace($eliminar,"",$clave);
                $clave=substr($clave, 2);
                if(is_object($valor)){
                    $valor=(array)$valor;
                   $ban=0;
                   foreach($valor as $clave2 => $valor2) {
                        if($ban==0){
                            $registros[$clave]=$valor2;
                            $ban=1;
                        }
                    }
                }else{
                    
                    $registros[$clave]=$valor;  
                }
            }
            $entity->setRegistro($registros);
            $entity->setIdUsuario($users);
            $entity->setIp($ip);
            $entity->setAccion("ELIMINAR");
            $entity->setCreate(new \DateTime('now'));
            $entity->setUpdate(new \DateTime('now'));
            return $entity;
    }
}
