<?php

namespace S\VentasBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Personas
 *
 * @ORM\Table(name="personas", uniqueConstraints={@ORM\UniqueConstraint(name="personas_nacionalidad_cedula_key", columns={"nacionalidad", "cedula"})})
 * @ORM\Entity(repositoryClass="S\VentasBundle\Repository\PersonasR")
 */
class Personas
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="personas_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="nacionalidad", type="string", length=1, nullable=false)
     */
    private $nacionalidad;

    /**
     * @var integer
     *
     * @ORM\Column(name="cedula", type="integer", nullable=false)
     */
    private $cedula;

    /**
     * @var string
     *
     * @ORM\Column(name="primer_nombre", type="string", length=45, nullable=false)
     */
    private $primerNombre;

    /**
     * @var string
     *
     * @ORM\Column(name="segundo_nombre", type="string", length=45, nullable=true)
     */
    private $segundoNombre;

    /**
     * @var string
     *
     * @ORM\Column(name="primer_apellido", type="string", length=45, nullable=false)
     */
    private $primerApellido;

    /**
     * @var string
     *
     * @ORM\Column(name="segundo_apellido", type="string", length=45, nullable=true)
     */
    private $segundoApellido;

    /**
     * @var integer
     *
     * @ORM\Column(name="tipo_personal", type="integer", nullable=true)
     */
    private $tipoPersonal = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="estatus", type="integer", nullable=false)
     */
    private $estatus;

    /**
     * @var string
     *
     * @ORM\Column(name="unidad_administrativa", type="string", length=150, nullable=true)
     */
    private $unidadAdministrativa;

    /**
     * @var string
     *
     * @ORM\Column(name="ubucacion_funcional", type="string", length=255, nullable=true)
     */
    private $ubucacionFuncional;

    /**
     * @var string
     *
     * @ORM\Column(name="descripcion_estatus_nomina", type="string", length=255, nullable=true)
     */
    private $descripcionEstatusNomina;

    /**
     * @var integer
     *
     * @ORM\Column(name="codigo_nomina", type="integer", nullable=true)
     */
    private $codigoNomina;

    /**
     * @var string
     *
     * @ORM\Column(name="nomina", type="string", length=255, nullable=true)
     */
    private $nomina;

    /**
     * @var integer
     *
     * @ORM\Column(name="nomina_cestaticket", type="integer", nullable=true)
     */
    private $nominaCestaticket;



    /**
     * Set nacionalidad
     *
     * @param string $nacionalidad
     *
     * @return Personas
     */
    public function setNacionalidad($nacionalidad)
    {
        $this->nacionalidad = $nacionalidad;

        return $this;
    }

    /**
     * Get nacionalidad
     *
     * @return string
     */
    public function getNacionalidad()
    {
        return $this->nacionalidad;
    }

    /**
     * Set cedula
     *
     * @param integer $cedula
     *
     * @return Personas
     */
    public function setCedula($cedula)
    {
        $this->cedula = $cedula;

        return $this;
    }

    /**
     * Get cedula
     *
     * @return integer
     */
    public function getCedula()
    {
        return $this->cedula;
    }

    /**
     * Set primerNombre
     *
     * @param string $primerNombre
     *
     * @return Personas
     */
    public function setPrimerNombre($primerNombre)
    {
        $this->primerNombre = $primerNombre;

        return $this;
    }

    /**
     * Get primerNombre
     *
     * @return string
     */
    public function getPrimerNombre()
    {
        return $this->primerNombre;
    }

    /**
     * Set segundoNombre
     *
     * @param string $segundoNombre
     *
     * @return Personas
     */
    public function setSegundoNombre($segundoNombre)
    {
        $this->segundoNombre = $segundoNombre;

        return $this;
    }

    /**
     * Get segundoNombre
     *
     * @return string
     */
    public function getSegundoNombre()
    {
        return $this->segundoNombre;
    }

    /**
     * Set primerApellido
     *
     * @param string $primerApellido
     *
     * @return Personas
     */
    public function setPrimerApellido($primerApellido)
    {
        $this->primerApellido = $primerApellido;

        return $this;
    }

    /**
     * Get primerApellido
     *
     * @return string
     */
    public function getPrimerApellido()
    {
        return $this->primerApellido;
    }

    /**
     * Set segundoApellido
     *
     * @param string $segundoApellido
     *
     * @return Personas
     */
    public function setSegundoApellido($segundoApellido)
    {
        $this->segundoApellido = $segundoApellido;

        return $this;
    }

    /**
     * Get segundoApellido
     *
     * @return string
     */
    public function getSegundoApellido()
    {
        return $this->segundoApellido;
    }

    /**
     * Set tipoPersonal
     *
     * @param integer $tipoPersonal
     *
     * @return Personas
     */
    public function setTipoPersonal($tipoPersonal)
    {
        $this->tipoPersonal = $tipoPersonal;

        return $this;
    }

    /**
     * Get tipoPersonal
     *
     * @return integer
     */
    public function getTipoPersonal()
    {
        return $this->tipoPersonal;
    }

    /**
     * Set estatus
     *
     * @param integer $estatus
     *
     * @return Personas
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
     * Set unidadAdministrativa
     *
     * @param string $unidadAdministrativa
     *
     * @return Personas
     */
    public function setUnidadAdministrativa($unidadAdministrativa)
    {
        $this->unidadAdministrativa = $unidadAdministrativa;

        return $this;
    }

    /**
     * Get unidadAdministrativa
     *
     * @return string
     */
    public function getUnidadAdministrativa()
    {
        return $this->unidadAdministrativa;
    }

    /**
     * Set ubucacionFuncional
     *
     * @param string $ubucacionFuncional
     *
     * @return Personas
     */
    public function setUbucacionFuncional($ubucacionFuncional)
    {
        $this->ubucacionFuncional = $ubucacionFuncional;

        return $this;
    }

    /**
     * Get ubucacionFuncional
     *
     * @return string
     */
    public function getUbucacionFuncional()
    {
        return $this->ubucacionFuncional;
    }

    /**
     * Set descripcionEstatusNomina
     *
     * @param string $descripcionEstatusNomina
     *
     * @return Personas
     */
    public function setDescripcionEstatusNomina($descripcionEstatusNomina)
    {
        $this->descripcionEstatusNomina = $descripcionEstatusNomina;

        return $this;
    }

    /**
     * Get descripcionEstatusNomina
     *
     * @return string
     */
    public function getDescripcionEstatusNomina()
    {
        return $this->descripcionEstatusNomina;
    }

    /**
     * Set codigoNomina
     *
     * @param integer $codigoNomina
     *
     * @return Personas
     */
    public function setCodigoNomina($codigoNomina)
    {
        $this->codigoNomina = $codigoNomina;

        return $this;
    }

    /**
     * Get codigoNomina
     *
     * @return integer
     */
    public function getCodigoNomina()
    {
        return $this->codigoNomina;
    }

    /**
     * Set nomina
     *
     * @param string $nomina
     *
     * @return Personas
     */
    public function setNomina($nomina)
    {
        $this->nomina = $nomina;

        return $this;
    }

    /**
     * Get nomina
     *
     * @return string
     */
    public function getNomina()
    {
        return $this->nomina;
    }

    /**
     * Set nominaCestaticket
     *
     * @param integer $nominaCestaticket
     *
     * @return Personas
     */
    public function setNominaCestaticket($nominaCestaticket)
    {
        $this->nominaCestaticket = $nominaCestaticket;

        return $this;
    }

    /**
     * Get nominaCestaticket
     *
     * @return integer
     */
    public function getNominaCestaticket()
    {
        return $this->nominaCestaticket;
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

    public function __toString() {
        
        return $this->cedula."-".$this->primerNombre." ".$this->primerApellido;
    }
}
