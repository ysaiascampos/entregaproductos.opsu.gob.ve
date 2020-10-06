<?php

namespace S\VentasBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Ventas
 *
 * @ORM\Table(name="ventas", uniqueConstraints={@ORM\UniqueConstraint(name="ventas_id_personal_id_eventos_key", columns={"id_personal", "id_eventos"})}, indexes={@ORM\Index(name="ventas_id_eventos_idx", columns={"id_eventos"}), @ORM\Index(name="IDX_808D9EA1518111", columns={"id_personal"})})
 * @ORM\Entity(repositoryClass="S\VentasBundle\Repository\VentasR")
 */
class Ventas
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="ventas_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var integer
     *
     * @ORM\Column(name="estatus", type="integer", nullable=false)
     */
    private $estatus = '0';

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="fecha_modificacion", type="datetime", nullable=true)
     */
    private $fechaModificacion;

    /**
     * @var string
     *
     * @ORM\Column(name="observacion", type="text", nullable=true)
     */
    private $observacion;

    /**
     * @var float
     *
     * @ORM\Column(name="monto1", type="float", precision=10, scale=0, nullable=true)
     */
    private $monto1;

    /**
     * @var float
     *
     * @ORM\Column(name="monto2", type="float", precision=10, scale=0, nullable=true)
     */
    private $monto2;

    /**
     * @var float
     *
     * @ORM\Column(name="monto3", type="float", precision=10, scale=0, nullable=true)
     */
    private $monto3;

    /**
     * @var \Eventos
     *
     * @ORM\ManyToOne(targetEntity="Eventos")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_eventos", referencedColumnName="id")
     * })
     */
    private $idEventos;

    /**
     * @var \Personas
     *
     * @ORM\ManyToOne(targetEntity="Personas")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_personal", referencedColumnName="id")
     * })
     */
    private $idPersonal;



    /**
     * Set estatus
     *
     * @param integer $estatus
     *
     * @return Ventas
     */
    public function setEstatus($estatus)
    {
        $this->estatus = $estatus;

        return $this;
    }

    /**
     * Get estatus
     *
     * @return integer
     */
    public function getEstatus()
    {
        return $this->estatus;
    }

    /**
     * Set fechaModificacion
     *
     * @param \DateTime $fechaModificacion
     *
     * @return Ventas
     */
    public function setFechaModificacion($fechaModificacion)
    {
        $this->fechaModificacion = $fechaModificacion;

        return $this;
    }

    /**
     * Get fechaModificacion
     *
     * @return \DateTime
     */
    public function getFechaModificacion()
    {
        return $this->fechaModificacion;
    }

    /**
     * Set observacion
     *
     * @param string $observacion
     *
     * @return Ventas
     */
    public function setObservacion($observacion)
    {
        $this->observacion = $observacion;

        return $this;
    }

    /**
     * Get observacion
     *
     * @return string
     */
    public function getObservacion()
    {
        return $this->observacion;
    }

    /**
     * Set monto1
     *
     * @param float $monto1
     *
     * @return Ventas
     */
    public function setMonto1($monto1)
    {
        $this->monto1 = $monto1;

        return $this;
    }

    /**
     * Get monto1
     *
     * @return float
     */
    public function getMonto1()
    {
        return $this->monto1;
    }

    /**
     * Set monto2
     *
     * @param float $monto2
     *
     * @return Ventas
     */
    public function setMonto2($monto2)
    {
        $this->monto2 = $monto2;

        return $this;
    }

    /**
     * Get monto2
     *
     * @return float
     */
    public function getMonto2()
    {
        return $this->monto2;
    }

    /**
     * Set monto3
     *
     * @param float $monto3
     *
     * @return Ventas
     */
    public function setMonto3($monto3)
    {
        $this->monto3 = $monto3;

        return $this;
    }

    /**
     * Get monto3
     *
     * @return float
     */
    public function getMonto3()
    {
        return $this->monto3;
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
     * Set idEventos
     *
     * @param \S\VentasBundle\Entity\Eventos $idEventos
     *
     * @return Ventas
     */
    public function setIdEventos(\S\VentasBundle\Entity\Eventos $idEventos = null)
    {
        $this->idEventos = $idEventos;

        return $this;
    }

    /**
     * Get idEventos
     *
     * @return \S\VentasBundle\Entity\Eventos
     */
    public function getIdEventos()
    {
        return $this->idEventos;
    }

    /**
     * Set idPersonal
     *
     * @param \S\VentasBundle\Entity\Personas $idPersonal
     *
     * @return Ventas
     */
    public function setIdPersonal(\S\VentasBundle\Entity\Personas $idPersonal = null)
    {
        $this->idPersonal = $idPersonal;

        return $this;
    }

    /**
     * Get idPersonal
     *
     * @return \S\VentasBundle\Entity\Personas
     */
    public function getIdPersonal()
    {
        return $this->idPersonal;
    }
 
    public function __toString() {
        
        return $this->idPersonal.$this->idEvento;
    }
}
