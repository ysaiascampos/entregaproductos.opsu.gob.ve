<?php

namespace S\VentasBundle\Repository;

use Doctrine\ORM\EntityRepository;

/**
 * EventoProductosRe
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class EventoProductosRe extends EntityRepository
{
		public function findOneByIdJoinedToProductosEvento($idEvento)
	{
	    return $this->getEntityManager()
            ->createQuery(
                'SELECT p, c, d FROM SVentasBundle:EventoProductos p JOIN p.idEvento c JOIN p.idProducto d WHERE p.idEvento= '.$idEvento
            )
            ->getResult();
	}
}
