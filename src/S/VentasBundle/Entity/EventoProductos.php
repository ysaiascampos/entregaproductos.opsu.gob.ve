<?php

namespace S\VentasBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * EventoProductos
 *
 * @ORM\Table(name="evento_productos", uniqueConstraints={@ORM\UniqueConstraint(name="evento_productos_id_evento_id_producto_key", columns={"id_evento", "id_producto"})}, indexes={@ORM\Index(name="evento_productos_id_producto_idx", columns={"id_producto"}), @ORM\Index(name="IDX_4B6CA3C861B1BEE8", columns={"id_evento"})})
 * @ORM\Entity(repositoryClass="S\VentasBundle\Repository\EventoProductosR")
 */
class EventoProductos
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="evento_productos_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var float
     *
     * @ORM\Column(name="precio", type="float", precision=10, scale=0, nullable=true)
     */
    private $precio = '0';

    /**
     * @var float
     *
     * @ORM\Column(name="cantidad", type="float", precision=10, scale=0, nullable=true)
     */
    private $cantidad = '0';

    /**
     * @var \Eventos
     *
     * @ORM\ManyToOne(targetEntity="Eventos")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_evento", referencedColumnName="id")
     * })
     */
    private $idEvento;

    /**
     * @var \Productos
     *
     * @ORM\ManyToOne(targetEntity="Productos")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_producto", referencedColumnName="id")
     * })
     */
    private $idProducto;



    /**
     * Set precio
     *
     * @param float $precio
     *
     * @return EventoProductos
     */
    public function setPrecio($precio)
    {
        $this->precio = $precio;

        return $this;
    }

    /**
     * Get precio
     *
     * @return float
     */
    public function getPrecio()
    {
        return $this->precio;
    }

    /**
     * Set cantidad
     *
     * @param float $cantidad
     *
     * @return EventoProductos
     */
    public function setCantidad($cantidad)
    {
        $this->cantidad = $cantidad;

        return $this;
    }

    /**
     * Get cantidad
     *
     * @return float
     */
    public function getCantidad()
    {
        return $this->cantidad;
    }

    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set idEvento
     *
     * @param \S\VentasBundle\Entity\Eventos $idEvento
     *
     * @return EventoProductos
     */
    public function setIdEvento(\S\VentasBundle\Entity\Eventos $idEvento = null)
    {
        $this->idEvento = $idEvento;

        return $this;
    }

    /**
     * Get idEvento
     *
     * @return \S\VentasBundle\Entity\Eventos
     */
    public function getIdEvento()
    {
        return $this->idEvento;
    }

    /**
     * Set idProducto
     *
     * @param \S\VentasBundle\Entity\Productos $idProducto
     *
     * @return EventoProductos
     */
    public function setIdProducto(\S\VentasBundle\Entity\Productos $idProducto = null)
    {
        $this->idProducto = $idProducto;

        return $this;
    }

    /**
     * Get idProducto
     *
     * @return \S\VentasBundle\Entity\Productos
     */
    public function getIdProducto()
    {
        return $this->idProducto;
    }

    public function __toString() {
        
        return $this->idProducto.$this->idEvento;
    }
}
